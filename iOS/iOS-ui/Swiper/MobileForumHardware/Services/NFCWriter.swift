//
//  NFCWriter.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import CoreNFC

class NFCWriter: NSObject, NFCNDEFReaderSessionDelegate {
    private var nfcSession: NFCNDEFReaderSession?
    private var onError: (String, String) -> ()
    private var message: String?
    
    init(onError: @escaping (String, String) -> ()) {
        self.onError = onError
        super.init()
    }
    
    func beginWritingSession(message: String) {
        guard NFCNDEFReaderSession.readingAvailable else {
            onError("Scanning Not Supported", "This device doesn't support tag scanning.")
            return
        }
        self.message = message
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        nfcSession?.alertMessage = "Hold your iPhone near an NDEF tag to write the message."
        nfcSession?.begin()
    }
    
    // MARK: - Reading NFC
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        if let readerError = error as? NFCReaderError {
            // Show an alert when the invalidation reason is not because of a
            // successful read during a single-tag read session, or because the
            // user canceled a multiple-tag read session from the UI or
            // programmatically using the invalidate method call.
            if readerError.code != .readerSessionInvalidationErrorFirstNDEFTagRead && readerError.code != .readerSessionInvalidationErrorUserCanceled {
                print(error.localizedDescription)
                onError("Session Invalidated", error.localizedDescription)
            }
        }
        
        // To read new tags, a new session instance is required.
        nfcSession = nil
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            // Process detected NFCNDEFMessage objects.
            for message in messages {
                for record in message.records {
                    if let string = String(data: record.payload, encoding: .unicode) {
                        print(string)
                    }
                }
            }
            self.nfcSession?.invalidate()
        }
    }
    
    // MARK: - Writing NFC
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        guard
            let message = self.message,
            let payload = NFCNDEFPayload.wellKnownTypeTextPayload(string: message, locale: .current)
        else {
            session.alertMessage = "Message is nil"
            session.invalidate()
            return
        }
        let nfcMessage = NFCNDEFMessage(records: [payload])
        
        if tags.count > 1 {
            // Restart polling in 500 milliseconds.
            let retryInterval = DispatchTimeInterval.milliseconds(500)
            session.alertMessage = "More than 1 tag detected. Please remove all tags and try again."
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        // Connect to the found tag and write an NDEF message to it.
        let tag = tags.first!
        session.connect(to: tag) { (error: Error?) in
            guard error == nil else {
                session.alertMessage = "Unable to connect to tag."
                session.invalidate()
                return
            }
            
            tag.queryNDEFStatus(completionHandler: { (ndefStatus: NFCNDEFStatus, capacity: Int, error: Error?) in
                guard error == nil else {
                    session.alertMessage = "Unable to query the NDEF status of tag."
                    session.invalidate()
                    return
                }
                
                switch ndefStatus {
                case .notSupported:
                    session.alertMessage = "Tag is not NDEF compliant."
                    session.invalidate()
                case .readOnly:
                    session.alertMessage = "Tag is read only."
                    session.invalidate()
                case .readWrite:
                    tag.writeNDEF(nfcMessage, completionHandler: { (error: Error?) in
                        if nil != error {
                            session.alertMessage = "Write NDEF message fail."
                            self.onError("Write fail", error?.localizedDescription ?? "")
                        } else {
                            session.alertMessage = "Write NDEF message successful."
                        }
                        session.invalidate()
                    })
                @unknown default:
                    session.alertMessage = "Unknown NDEF tag status."
                    session.invalidate()
                }
            })
        }
    }
}

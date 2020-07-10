//
//  NFCReader.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/13.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import CoreNFC

class NFCReader: NSObject, NFCNDEFReaderSessionDelegate {
    private var nfcSession: NFCNDEFReaderSession?
    private var onError: (String, String) -> ()
    
    init(onError: @escaping (String, String) -> ()) {
        self.onError = onError
        super.init()
    }
    
    func beginReaderSession() {
        guard NFCNDEFReaderSession.readingAvailable else {
            onError("Scanning Not Supported", "This device doesn't support tag scanning.")
            return
        }
        nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        nfcSession?.alertMessage = "Hold your iPhone near a tag to get extra super likes."
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
                    switch record.typeNameFormat {
                    case .absoluteURI:
                        if let url = record.wellKnownTypeURIPayload() {
                            print(url.absoluteString)
                        }
                    case .nfcWellKnown:
                        if let text = record.wellKnownTypeTextPayload().0 {
                            print(text)
                        }
                    default:
                        print(record.typeNameFormat)
                    }
                }
            }
            InMemoryDatabase.shared.currentUser?.increaseSuperLikes(by: 1)
            self.nfcSession?.invalidate()
        }
    }
}

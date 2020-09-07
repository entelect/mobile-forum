//
//  MemoryViewModel.swift
//  MemoryLeak
//
//  Created by Armand Kamffer on 2020/07/22.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class MemoryViewModel {
    var delegate: Service
    var errorHandler: (() -> Void)?
    
    init(delegate: Service) {
        self.delegate = delegate
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate.eventOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.errorHandler?()
        }
    }
}

protocol Service {
    func eventOccurred()
}

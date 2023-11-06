//
//  Sender.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public struct Sender {
    public let id: String
    public let fullName: String
    public let meta: String?
    
    public init(id: String, fullName: String, meta: String?) {
        self.id = id
        self.fullName = fullName
        self.meta = meta
    }
}

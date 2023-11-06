//
//  SampleSender.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public struct SampleSender: Hashable {
    public let senderId: String
    public let senderFullName: String
    public let senderMeta: String?
    
    public init(senderId: String, senderFullName: String, senderMeta: String?) {
        self.senderId = senderId
        self.senderFullName = senderFullName
        self.senderMeta = senderMeta
    }
}

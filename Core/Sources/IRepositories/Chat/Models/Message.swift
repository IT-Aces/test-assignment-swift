//
//  Message.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public struct Message: Identifiable {
    public let id: UUID
    public let sender: Sender
    public let media: [URL]?
    
    public init(id: UUID, sender: Sender, media: [URL]?) {
        self.id = id
        self.sender = sender
        self.media = media
    }
    
    public var type: SenderType {
        switch sender.meta {
        case "Unk":
            return .me
            
        default:
            return .other
        }
    }
    
    public enum SenderType {
        case me, other
    }
}

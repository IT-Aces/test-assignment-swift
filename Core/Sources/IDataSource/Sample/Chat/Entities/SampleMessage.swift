//
//  SampleMessage.swift
//  
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public struct SampleMessage: Hashable {
    public let sender: SampleSender?
    public let media: [NSURL]?
    
    public init(sender: SampleSender?, media: [NSURL]?) {
        self.sender = sender
        self.media = media
    }
}

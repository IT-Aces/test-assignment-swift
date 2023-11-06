//
//  MessageMapper.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation
import IDataSource
import IRepositories

struct MessageMapper: Mapper {
    typealias InputType = SampleMessage
    typealias OutputType = Message
    
    func map(to inputData: InputType) -> OutputType? {
        guard let senderEntity = inputData.sender else { return nil }
        
        let urls = inputData.media?.compactMap({ $0.absoluteURL })
        
        let sender = Sender(
            id: senderEntity.senderId,
            fullName: senderEntity.senderFullName,
            meta: senderEntity.senderMeta
        )
        
        let message = Message(
            id: UUID(),
            sender: sender,
            media: urls
        )
        return message
    }
    
}

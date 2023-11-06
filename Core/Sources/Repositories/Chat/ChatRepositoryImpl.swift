//
//  ChatRepositoryImpl.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation
import IDataSource
import IRepositories

public struct ChatRepositoryImpl: ChatRepository {
    private let api: ChatDataSource
    private let mapper = MessageMapper()
    
    public init(api: ChatDataSource) {
        self.api = api
    }
    
    public func getMessages(callback: @escaping ([Message]) -> Void) {
        api.getMessages { entities in
            let messages = entities
                .compactMap({ mapper.map(to: $0) })
            callback(Array(messages))
        }
    }
}

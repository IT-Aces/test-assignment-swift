//
//  ChatRepository.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public protocol ChatRepository {
    func getMessages(callback: @escaping (_ messages: [Message]) -> Void)
}

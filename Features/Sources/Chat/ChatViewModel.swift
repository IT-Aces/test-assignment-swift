//
//  ChatViewModel.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import DataSource
import Foundation
import IRepositories
import IDataSource
import Repositories

extension ChatViewController {
    final class ViewModel {

        // MARK: - Properties
        
        private let chatRepository: ChatRepository = ChatRepositoryImpl(
            api: ChatSampleDataSourceImpl()
        )
        private(set) var messages: [Message] = []
        
        // MARK: - Public Methods
        
        func fetchMessages(completion: @escaping (() -> Void)) {
            chatRepository.getMessages { [weak self] messages in
                guard let self else { return }
                self.messages = messages
                completion()
            }
        }
    }
}

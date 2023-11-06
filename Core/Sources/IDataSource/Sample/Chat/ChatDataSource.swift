//
//  ChatDataSource.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation

public protocol ChatDataSource {
    func getMessages(callback: @escaping (_ messages: [SampleMessage]) -> Void)
}

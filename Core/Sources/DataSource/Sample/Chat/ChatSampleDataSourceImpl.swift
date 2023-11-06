//
//  ChatSampleDataSourceImpl.swift
//
//
//  Created by Артём Клыч on 01.11.2023.
//

import Foundation
import IDataSource

public struct ChatSampleDataSourceImpl: ChatDataSource {
    
    private let outSender = SampleSender(
        senderId: "00", senderFullName: "Unknown", senderMeta: "Unk"
    )
    
    private let inSender = SampleSender(
        senderId: "01",
        senderFullName: "Long Sender Nameeeeeeeeeeee",
        senderMeta: "Patient"
    )
    
    public init() {}
    
    public func getMessages(
        callback: @escaping ([SampleMessage]) -> Void
    ) {
        callback([
            SampleMessage(
                sender: self.inSender,
                media: [
                    NSURL(string: "https://placekitten.com/g/200/300")!,
                    NSURL(string: "https://placekitten.com/g/300/300")!,
                    NSURL(string: "https://placekitten.com/g/400/400")!,
                ]
            ),
            SampleMessage(
                sender: self.inSender,
                media: [
                    NSURL(string: "https://placekitten.com/g/300/400")!
                ]
            ),
            SampleMessage(
                sender: self.outSender,
                media: [
                    NSURL(string: "https://placekitten.com/g/200/400")!
                ]
            ),
            SampleMessage(
                sender: self.outSender,
                media: [
                    NSURL(string: "https://placekitten.com/g/400/400")!,
                    NSURL(string: "https://placekitten.com/g/200/200")!,
                    NSURL(string: "https://placekitten.com/g/300/400")!,
                    NSURL(string: "https://placekitten.com/g/300/200")!,
                ]
            )
        ])
    }
    
}

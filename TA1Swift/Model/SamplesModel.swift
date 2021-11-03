//
//  SamplesModel.swift
//  TA1Swift
//
//  Created by Ivan Manov on 29.03.2021.
//

import Foundation

struct SampleDataSource: Hashable {
    private let outSender = SampleSender(
        senderId: "00", senderFullName: "Unknown", senderMeta: "Unk"
    )
    private let inSender = SampleSender(
        senderId: "01", senderFullName: "Long Sender Nameeeeeeeeeeee", senderMeta: "Patient"
    )
    
    func loadMessages(callback: @escaping (_ messages: [SampleMessage]) -> Void) {
        callback([
            SampleMessage(sender: self.inSender,
                          media: [
                            NSURL(string: "https://placekitten.com/g/200/300")!,
                            NSURL(string: "https://placekitten.com/g/300/300")!,
                            NSURL(string: "https://placekitten.com/g/400/400")!,
                          ]),
            SampleMessage(sender: self.inSender,
                          media: [
                            NSURL(string: "https://placekitten.com/g/300/400")!
                          ]),
            SampleMessage(sender: self.outSender,
                          media: [
                            NSURL(string: "https://placekitten.com/g/200/400")!
                          ]),
            SampleMessage(sender: self.outSender,
                          media: [
                            NSURL(string: "https://placekitten.com/g/400/400")!,
                            NSURL(string: "https://placekitten.com/g/200/200")!,
                            NSURL(string: "https://placekitten.com/g/300/400")!,
                            NSURL(string: "https://placekitten.com/g/300/200")!,
                          ])
        ])
    }
}

enum SampleMessageType {
    case outdoring
    case incoming
}

struct SampleMessage: Hashable {
    let sender: SampleSender?
    let media: [NSURL]?
    
    var messageType: SampleMessageType {
        if self.sender?.senderId == "01" {
            return SampleMessageType.incoming
        }
        return SampleMessageType.outdoring
    }
}

struct SampleSender: Hashable {
    let senderId: String
    let senderFullName: String
    let senderMeta: String?
}

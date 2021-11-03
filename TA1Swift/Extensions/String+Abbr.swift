//
//  String+Abbr.swift
//  TA1Swift
//
//  Created by Slava Starovoitov on 04.11.2021.
//

import UIKit

extension String {

    func abbr(separator: String? = " ",  divider: String? = "") -> String {

        if let separator = separator, let divider = divider {
            let result = self.components(separatedBy: separator)
                .compactMap({ String( $0.first! ) })
                .joined(separator: divider)

            return String(result)
        }
        return String()
    }

}

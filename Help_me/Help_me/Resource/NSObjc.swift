//
//  NSObjc.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

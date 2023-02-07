//
//  SignAPI.swift
//  Help_me
//
//  Created by 최시훈 on 2023/02/07.
//

import Foundation

struct LoginData: Decodable, Hashable {
    let status: Int
    let message: String
}

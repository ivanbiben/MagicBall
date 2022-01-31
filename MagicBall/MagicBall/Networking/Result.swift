//
//  Result.swift
//  MagicBall
//
//  Created by Biben on 31.01.2022.
//

import Foundation

enum Result<T> {
    case succ(T)
    case error(String)
}

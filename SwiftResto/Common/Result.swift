//
//  Result.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

public enum Result<T> {
    case success(data: T)
    case error(message: String)
}

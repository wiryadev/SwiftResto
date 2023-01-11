//
//  Result.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

public enum Result<T> {
    case Success(data: T)
    case Error(message: String)
}

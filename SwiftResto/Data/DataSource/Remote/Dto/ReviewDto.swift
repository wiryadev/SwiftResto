//
//  ReviewDto.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct ReviewDto: Decodable {
    let name: String
    let review: String
    let date: String
}

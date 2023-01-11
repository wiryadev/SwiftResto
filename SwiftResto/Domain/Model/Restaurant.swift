//
//  Restaurant.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct Restaurant: Identifiable {
    let id: String
    let name: String
    let description: String
    let picture: String
    let location: String
    let address: String?
    let rating: Double
    let reviews: [Review]
}

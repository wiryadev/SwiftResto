//
//  RestaurantDto.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct RestaurantsResponse: Decodable {
    let error: Bool
    let message: String
    let count: Int
    let restaurants: [RestaurantDto]
}

struct RestaurantDto: Decodable {
    let id: String
    let name: String
    let description: String
    let pictureId: String
    let city: String
    let rating: Double
}

struct RestaurantDetailResponse: Decodable {
    let error: Bool
    let message: String
    let restaurant: RestaurantDetailDto
}

struct RestaurantDetailDto: Decodable {
    let id: String
    let name: String
    let description: String
    let pictureId: String
    let city: String
    let address: String
    let rating: Double
    let reviews: [ReviewDto]
}

//
//  RestaurantRepository.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

protocol RestaurantRepository {
    
    func getRestaurants() async throws -> [RestaurantDto]
    
    func searchRestaurants(query: String) async throws -> [RestaurantDto]
    
    func getRestaurantDetail(id: String) async throws -> RestaurantDetailDto
    
}

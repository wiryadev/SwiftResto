//
//  RestaurantRepositoryImpl.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct RestaurantRepositoryImpl: RestaurantRepository {
    
    var dataSource: RestaurantRemoteDataSource
    
    func getRestaurants() async throws -> [RestaurantDto] {
        let restaurants = try await dataSource.getRestaurants().restaurants
        return restaurants
    }
    
    func searchRestaurants(query: String) async throws -> [RestaurantDto] {
        let restaurants = try await dataSource.searchRestaurants(query: query).restaurants
        return restaurants
    }
    
    func getRestaurantDetail(id: String) async throws -> RestaurantDetailDto {
        let restaurant = try await dataSource.getRestaurantDetail(id: id).restaurant
        return restaurant
    }
    
    
}

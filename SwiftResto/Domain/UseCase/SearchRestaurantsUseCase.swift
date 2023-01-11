//
//  SearchRestaurantsUseCase.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct SearchRestaurantsUseCase {
    
    var repository: RestaurantRepository
    
    func execute(query: String) async -> Result<[Restaurant]> {
        do {
            let restaurants = try await repository.searchRestaurants(query: query).map { item in
                Restaurant(
                    id: item.id,
                    name: item.name,
                    description: item.description,
                    picture: "\(Constants.MEDIUM_PICTURE_URL)\(item.pictureId)",
                    location: item.city,
                    address: nil,
                    rating: item.rating,
                    reviews: []
                )
            }
            return Result.Success(data: restaurants)
        } catch (let error) {
            return Result.Error(message: error.localizedDescription)
        }
    }
    
}

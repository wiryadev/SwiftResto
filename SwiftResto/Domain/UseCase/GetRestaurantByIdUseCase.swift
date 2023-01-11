//
//  GetRestaurantByIdUseCase.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

struct GetRestaurantById {
    var repository: RestaurantRepository
    
    func execute(id: String) async -> Result<Restaurant> {
        do {
            let item = try await repository.getRestaurantDetail(id: id)
            let restaurant = Restaurant(
                id: item.id,
                name: item.name,
                description: item.description,
                picture: "\(Constants.LARGE_PICTURE_URL)\(item.pictureId)",
                location: item.city,
                address: item.address,
                rating: item.rating,
                reviews: item.customerReviews.map({ reviewDto in
                    Review(
                        name: reviewDto.name,
                        review: reviewDto.review,
                        date: reviewDto.date
                    )
                })
            )
            return Result.Success(data: restaurant)
        } catch (let error) {
            return Result.Error(message: error.localizedDescription)
        }
    }
}

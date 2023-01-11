//
//  SearchViewModel.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    private let searchRestaurants = SearchRestaurantsUseCase(
        repository: RestaurantRepositoryImpl(
            dataSource: RestaurantRemoteDataSource()
        )
    )
    
    @Published var restaurants: [Restaurant] = []
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    func findRestaurants(query: String) async {
        isLoading = true
        let result = await searchRestaurants.execute(query: query)
        switch result {
        case .Success(let data):
            self.restaurants = data
            self.errorMessage = ""
        case .Error(let message):
            self.restaurants = []
            self.errorMessage = message
        }
        isLoading = false
    }
}

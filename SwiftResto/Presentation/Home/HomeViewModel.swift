//
//  HomeViewModel.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

extension HomeView {
    
    @MainActor
    class HomeViewModel: ObservableObject {
        
        private let getAllRestaurant = GetAllRestaurantUseCase(
            repository: RestaurantRepositoryImpl(
                dataSource: RestaurantRemoteDataSource()
            )
        )
        
        @Published var restaurants: [Restaurant] = []
        @Published var errorMessage = ""
        @Published var isLoading = false
        
        func getRestaurants() async {
            isLoading = true
            let result = await getAllRestaurant.execute()
            switch result {
            case .success(let data):
                self.restaurants = data
                self.errorMessage = ""
            case .error(let message):
                self.restaurants = []
                self.errorMessage = message
            }
            isLoading = false
        }
    }
}

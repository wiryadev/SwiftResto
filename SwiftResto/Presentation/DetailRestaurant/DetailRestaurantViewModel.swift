//
//  DetailRestaurantViewModel.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation

@MainActor
class DetailRestaurantViewModel: ObservableObject {
    
    private let getRestaurantById = GetRestaurantById(
        repository: RestaurantRepositoryImpl(
            dataSource: RestaurantRemoteDataSource()
        )
    )
    
    @Published var restaurant: Restaurant? = nil
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    func getRestaurantDetail(id: String) async {
        isLoading = true
        let result = await getRestaurantById.execute(id: id)
        switch result {
        case .Success(let data):
            self.restaurant = data
            self.errorMessage = ""
        case .Error(let message):
            self.errorMessage = message
        }
        isLoading = false
    }
}

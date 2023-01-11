//
//  RestaurantRemoteImpl.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import Foundation
import Alamofire

struct RestaurantRemoteDataSource {
    
    func getRestaurants() async throws -> RestaurantsResponse {
        return try await getResponseFromApi(stringUrl: "\(Constants.BASE_URL)list")
    }
    
    func getRestaurantDetail(id: String) async throws -> RestaurantDetailResponse {
        return try await getResponseFromApi(stringUrl: "\(Constants.BASE_URL)/detail/\(id)")
    }
    
    private func getResponseFromApi<T: Decodable>(stringUrl: String) async throws -> T {
        let url = URL(string: stringUrl)!
        let data: T = try await withCheckedThrowingContinuation({ continuation in
            AF.request(url).responseDecodable(of: T.self) { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    continuation .resume(returning: data)
                case .failure(let error):
                    continuation .resume(throwing: error)
                }
            }
        })

        return data
    }
    
}

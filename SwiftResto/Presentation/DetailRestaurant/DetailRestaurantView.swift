//
//  DetailRestaurantView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct DetailRestaurantView: View {
    
    let id: String
    
    @StateObject var viewModel = DetailRestaurantViewModel()
    
    var body: some View {
        VStack {
            if (viewModel.isLoading) {
                ProgressView()
            } else {
                Text(viewModel.restaurant?.name ?? "")
                    .toolbar(Visibility.hidden, for: .tabBar)
            }
        }
        .onAppear {
            Task {
                await viewModel.getRestaurantDetail(id: id)
            }
        }
    }
}

struct DetailRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRestaurantView(id: "rqdv5juczeskfw1e867")
    }
}

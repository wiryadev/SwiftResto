//
//  HomeView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    private var isError: Binding<Bool> {
        Binding(
            get: {
                !self.viewModel.errorMessage.isEmpty
            },
            set: {_ in }
        )
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.restaurants) { item in
                            NavigationLink {
                                DetailRestaurantView(id: item.id)
                            } label: {
                                RestaurantItemView(restaurant: item)
                                    .foregroundColor(.black)
                            }
                            .listRowSeparator(.hidden)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
                .listStyle(PlainListStyle())
                .task {
                    await viewModel.getRestaurants()
                }
                .alert("Error", isPresented: isError) {
                } message: {
                    Text(viewModel.errorMessage)
                }
                if (viewModel.isLoading) {
                    ProgressView()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

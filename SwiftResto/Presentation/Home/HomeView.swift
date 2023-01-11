//
//  HomeView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    if viewModel.errorMessage.isEmpty {
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
                    } else {
                        VStack {
                            Image(systemName: "exclamationmark.icloud")
                            Text(viewModel.errorMessage)
                                .padding(.top, 8)
                                .padding(.bottom, 16)
                            Button {
                                Task {
                                    await viewModel.getRestaurants()
                                }
                            } label: {
                                Text("Retry")
                            }
                        }
                        .padding(.vertical, 64)
                    }
                }
                .frame(maxWidth: .infinity)
                .listStyle(PlainListStyle())
                .task {
                    await viewModel.getRestaurants()
                }
                if viewModel.isLoading {
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

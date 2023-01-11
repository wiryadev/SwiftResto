//
//  SearchView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    if (searchText.isEmpty
                        && viewModel.restaurants.isEmpty) {
                        VStack {
                            Image(systemName: "rectangle.and.text.magnifyingglass")
                            Text("Try to search something first")
                        }
                        .padding(.vertical, 128)
                        
                    } else {
                        if (viewModel.isLoading) {
                            ProgressView()
                        } else {
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
                    }
                }
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Find your favorite resto"
                )
                .autocorrectionDisabled()
                .onSubmit(of: .search) {
                    Task {
                        await viewModel.findRestaurants(query: searchText)
                    }
                }
                .frame(maxWidth: .infinity)
                .listStyle(PlainListStyle())
                if (viewModel.isLoading) {
                    ProgressView()
                }
            }
            .navigationTitle("Search Resto")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

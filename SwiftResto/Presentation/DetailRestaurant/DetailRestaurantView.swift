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
        ScrollView {
            VStack {
                if (viewModel.isLoading) {
                    ProgressView()
                } else {
                    // MARK: Image
                    VStack {
                        AsyncImage(url: URL(string: viewModel.restaurant?.picture ?? "")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    // MARK: Overview
                    VStack(alignment: .leading) {
                        HStack {
                            Text(viewModel.restaurant?.name ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Spacer()
                            HStack {
                                Image(systemName: "star.fill")
                                if let rating = viewModel.restaurant?.rating {
                                    Text(String(format: "%.2f", rating))
                                        .fontWeight(.bold)
                                } else {
                                    Text("")
                                }
                            }
                            .foregroundColor(.yellow)
                        }
                        
                        HStack {
                            Image(systemName: "location.fill")
                            Text(viewModel.restaurant?.location ?? "")
                        }
                        .padding(.bottom, 1)
                        
                        Text(viewModel.restaurant?.description ?? "")
                            .font(.body)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    .frame(maxWidth: .infinity)
                }
                
                // MARK: Review
                let reviews = Array(viewModel.restaurant?.reviews ?? [])
                HStack {
                    Text("Customer Reviews")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading, 16)
                
                VStack {
                    ForEach(reviews, id: \.self) { item in
                        ReviewItemView(review: item)
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
        .padding(.bottom, 16)
        .onAppear {
            Task {
                await viewModel.getRestaurantDetail(id: id)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct DetailRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        DetailRestaurantView(id: "rqdv5juczeskfw1e867")
    }
}

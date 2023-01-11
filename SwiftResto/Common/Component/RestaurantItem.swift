//
//  RestaurantItem.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct RestaurantItem: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        HStack(
            alignment: .center
        ) {
            AsyncImage(
                url: URL(string: restaurant.picture)
            ) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 128, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(
                alignment: .leading
            ) {
                Text(restaurant.name)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text(restaurant.location)
                    .font(.italic(.body)())
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            Spacer()
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
    }
}

struct RestaurantItem_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantItem(
            restaurant: Restaurant(
                id: "rqdv5juczeskfw1e867",
                name: "Melting Pot",
                description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
                picture: "\(Constants.MEDIUM_PICTURE_URL)14",
                location: "Medan",
                address: "Jln. Pandeglang no 19",
                rating: 4.2,
                reviews: [
                    Review(
                        name: "Ahmad",
                        review: "Tidak rekomendasi untuk pelajar!",
                        date: "13 November 2019"
                    )
                ]
            )
        )
    }
}

//
//  ReviewItemView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct ReviewItemView: View {
    
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(review.name)
                    .bold()
                Text("-")
                Text(review.date)
                    .font(.callout)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.bottom, 1)
            Text(review.review)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 1)
        .padding(.horizontal, 16)
        .background(Color.red)
    }
}

struct ReviewItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItemView(
            review: Review(
                name: "Ahmad",
                review: "Tidak rekomendasi untuk pelajar!",
                date: "13 November 2019"
            )
        )
    }
}

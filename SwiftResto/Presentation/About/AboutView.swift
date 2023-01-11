//
//  AboutView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("about-pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 192, height: 192)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Abrar Wiryawan")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                Text("abrarwiryawan@gmail.com")
            }
            .navigationTitle("About")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

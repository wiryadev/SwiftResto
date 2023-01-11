//
//  AboutView.swift
//  SwiftResto
//
//  Created by Abrar Wiryawan on 11/01/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Image("about-pic")
                .clipShape(Circle())
            
            Text("Abrar Wiryawan")
            Text("abrarwiryawan@gmail.com")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

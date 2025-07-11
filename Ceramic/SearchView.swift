//
//  SearchView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//


import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var results: [CeramicProduct] {
        if searchText.isEmpty { return sampleProducts }
        return sampleProducts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    var body: some View {
        VStack {
            TextField("Search products...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List(results) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 38, height: 38)
                            .cornerRadius(6)
                        Text(product.name)
                        Spacer()
                        Text("₫\(Int(product.price)).000")
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}



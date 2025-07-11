//
//  ProductDetailView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: CeramicProduct
    @State private var showAdded = false
    @EnvironmentObject var cart: CartModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .cornerRadius(24)
                .padding(.top)
            VStack(alignment: .leading, spacing: 12) {
                Text(product.name)
                    .font(.title.bold())
                Text("₫\(Int(product.price)).000")
                    .font(.title2.bold())
                    .foregroundColor(.accentColor)
                Text("Elegant handmade ceramic. Durable, beautiful, unique for your space.")
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: {
                cart.add(product: product)
                showAdded = true
            }) {
                HStack {
                    Spacer()
                    Text("Add to Cart")
                        .font(.title3.bold())
                        .padding()
                    Spacer()
                }
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(16)
            }
            .padding(.bottom)
            .alert(isPresented: $showAdded) {
                Alert(title: Text("Added to Cart"), message: Text("\(product.name) is in your cart!"), dismissButton: .default(Text("OK")))
            }
        }
        .padding(.horizontal)
    }
}

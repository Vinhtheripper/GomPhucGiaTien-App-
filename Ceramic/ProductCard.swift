//
//  ProductCard.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct ProductCard: View {
    let product: CeramicProduct
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                    .background(Color(.systemGray6))
                    .cornerRadius(18)
                    .shadow(radius: 4)
                if product.isNew {
                    Text("New")
                        .font(.caption2.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(8)
                }
            }
            Text(product.name)
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(2)
            Text("₫\(Int(product.price)).000")
                .font(.subheadline)
                .foregroundColor(.accentColor)
        }
        .frame(width: 170)
    }
}



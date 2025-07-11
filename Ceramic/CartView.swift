//
//  CartView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartModel
    @State private var showCheckout = false

    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    Text("Your cart is empty")
                        .foregroundColor(.secondary)
                        .padding()
                } else {
                    List {
                        ForEach(cart.items) { item in
                            HStack {
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(8)
                                Text(item.name)
                                Spacer()
                                Text("₫\(Int(item.price)).000")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .onDelete(perform: cart.remove)
                    }
                    HStack {
                        Text("Total:")
                            .font(.title3.bold())
                        Spacer()
                        Text("₫\(Int(cart.total)).000")
                            .font(.title3.bold())
                    }
                    .padding()
                    Button(action: { showCheckout = true }) {
                        Text("Checkout")
                            .font(.title2.bold())
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                    .padding()
                    .sheet(isPresented: $showCheckout) {
                        NavigationView { CheckoutView() }
                    }
                }
            }
            .navigationTitle("Cart")
        }
    }
}

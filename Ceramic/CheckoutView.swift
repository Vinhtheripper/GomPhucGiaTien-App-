//
//  CheckoutView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//
import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cart: CartModel
    @State private var address = ""
    @State private var note = ""
    @State private var confirmed = false

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Shipping Address")
                .font(.headline)
            TextField("Enter address...", text: $address)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Order Note (optional)")
            TextField("Add note...", text: $note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("Total:")
                    .font(.title3.bold())
                Spacer()
                Text("₫\(Int(cart.total)).000")
                    .font(.title3.bold())
            }
            Button("Place Order") {
                confirmed = true
                cart.clear()
            }
            .font(.title2.bold())
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(14)
            .disabled(address.isEmpty)
            Spacer()
        }
        .padding()
        .alert(isPresented: $confirmed) {
            Alert(
                title: Text("Order Placed!"),
                message: Text("Thank you for your purchase."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Checkout")
    }
}


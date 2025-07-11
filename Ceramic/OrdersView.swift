//
//  OrdersView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct OrdersView: View {
    // Demo đơn mẫu
    let orders = [
        Order(items: [sampleProducts[0], sampleProducts[1]], total: 700000, status: "Shipping"),
        Order(items: [sampleProducts[2]], total: 780000, status: "Delivered"),
    ]
    var body: some View {
        List(orders) { order in
            VStack(alignment: .leading, spacing: 6) {
                Text("Order: \(order.id.uuidString.prefix(8))...").font(.headline)
                Text("Status: \(order.status)")
                    .foregroundColor(order.status == "Delivered" ? .green : .blue)
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("₫\(Int(item.price)).000")
                    }
                }
                Text("Total: ₫\(Int(order.total)).000")
                    .font(.subheadline.bold())
                    .padding(.top, 2)
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("My Orders")
    }
}


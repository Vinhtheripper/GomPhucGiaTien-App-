//
//  CeramicModels.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct CeramicProduct: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: Double
    let isNew: Bool
}

struct Order: Identifiable {
    let id = UUID()
    let items: [CeramicProduct]
    let total: Double
    let status: String // "Shipping", "Delivered", "Canceled"
}

// Dữ liệu mẫu cho thử nghiệm
let sampleProducts = [
    CeramicProduct(name: "Vase Aurora", imageName: "vase1", price: 480000, isNew: true),
    CeramicProduct(name: "Minimalist Bowl", imageName: "bowl1", price: 220000, isNew: false),
    CeramicProduct(name: "Zen Tea Set", imageName: "teaset", price: 780000, isNew: true),
    CeramicProduct(name: "Classic Plate", imageName: "plate1", price: 165000, isNew: false),
]

// Quản lý giỏ hàng
class CartModel: ObservableObject {
    @Published var items: [CeramicProduct] = []
    func add(product: CeramicProduct) { items.append(product) }
    func remove(at offsets: IndexSet) { items.remove(atOffsets: offsets) }
    var total: Double { items.map { $0.price }.reduce(0, +) }
    func clear() { items.removeAll() }
}



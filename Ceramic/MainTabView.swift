//
//  MainTabView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var cart = CartModel()
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Label("Home", systemImage: "house") }
            PotteryTourView()
                .tabItem { Label("Tour", systemImage: "paintbrush.pointed") }
            BlogView()
                .tabItem { Label("Blog", systemImage: "book.closed") }
            OrdersView()
                .tabItem { Label("Orders", systemImage: "cube.box") }
        }
        .environmentObject(cart)
    }
}



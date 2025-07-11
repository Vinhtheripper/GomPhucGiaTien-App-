import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cart: CartModel
    @State private var showSearch = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    // Banner
                    ZStack(alignment: .bottomLeading) {
                        Image("ceramic_banner")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 240)
                            .clipped()
                            .cornerRadius(24)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ceramic Artistry")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            Text("Handcrafted beauty for your home")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.9))
                        }
                        .padding()
                        .background(BlurView(style: .systemMaterialDark).cornerRadius(16))
                        .offset(y: -10)
                    }
                    .padding(.horizontal)

                    // Search Button
                    Button(action: { showSearch = true }) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search ceramics...")
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    .sheet(isPresented: $showSearch) {
                        NavigationView { SearchView() }
                    }

                    // Product List
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Featured Products")
                            .font(.title2.bold())
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(sampleProducts) { product in
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                        ProductCard(product: product)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart")
                            .font(.title2)
                            .foregroundColor(.accentColor)
                    }
                }
            }
        }
    }
}


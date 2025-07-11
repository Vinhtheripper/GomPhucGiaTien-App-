import SwiftUI

struct IntroView: View {
    @State private var showMain = false

    var body: some View {
        ZStack {
            // Background
            Image("ceramic_banner")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 24)
                .opacity(0.85)

            VStack(spacing: 40) {
                Spacer()
                // Logo/Hình minh họa lớn
                Image("ceramic_banner")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
                    .shadow(radius: 14)
                
                VStack(spacing: 18) {
                    Text("Gốm Phúc Gia Tiên")
                        .font(.system(size: 36, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Text("Nâng tầm không gian sống với những tác phẩm thủ công độc đáo, đậm chất văn hóa và đương đại.")
                        .font(.title3)
                        .foregroundColor(.white.opacity(0.93))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .frame(maxWidth: 400)
                }
                Spacer()
                
                // Nút
                Button(action: { withAnimation { showMain = true } }) {
                    Text("Khám Phá Ngay")
                        .font(.title3.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.white.opacity(0.88))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 38)
                .cornerRadius(18)   // Đặt sau padding mới ăn!
                .shadow(radius: 8)
                .padding(.bottom, 44)
            }
        }
        .fullScreenCover(isPresented: $showMain) {
            MainTabView()
        }
    }
}


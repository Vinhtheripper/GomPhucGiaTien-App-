//
//  BlogView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI
struct BlogPost: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let coverImage: String
    let content: String
}
let blogPosts = [
    BlogPost(
        title: "Hơi Thở Nghề Gốm Truyền Thống",
        subtitle: "Bước qua thời gian, những bàn tay vẫn vẹn nguyên ngọn lửa đam mê.",
        coverImage: "blog1",
        content: """
        Làng nghề gốm Bát Tràng đã tồn tại hàng trăm năm, qua bao thế hệ nghệ nhân gìn giữ. Những lò gốm đỏ lửa mỗi sớm mai, những bàn tay nhào nặn đất sét, tạo hình từng tác phẩm không lẫn vào đâu được.
        
        > “Mỗi sản phẩm là một câu chuyện, một phần hồn gửi lại trong men đất...”

        Không chỉ là vật dụng thường ngày, gốm ở đây còn là giá trị văn hoá, ký ức quê hương, là niềm tự hào của cả một cộng đồng.
        """
    ),
    BlogPost(
        title: "Khám Phá Quy Trình Tạo Tác Gốm",
        subtitle: "Từ đất thành hoa văn – hành trình của sự kiên nhẫn.",
        coverImage: "blog2",
        content: """
        Để ra lò một sản phẩm, người nghệ nhân phải trải qua hơn 20 công đoạn, từ chọn đất, xử lý, tạo hình, phơi khô, trang trí, tráng men, rồi nung lò nhiều giờ.
        
        > “Cái đẹp phải đến từ sự tỉ mỉ và cả trái tim...”

        Mỗi vết nứt, mỗi màu men đều chứa đựng một câu chuyện riêng. Đó là lý do vì sao gốm thủ công luôn khác biệt và giàu cảm xúc.
        """
    )
]


struct BlogView: View {
    @State private var selectedPost: BlogPost? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 28) {
                    // Header
                    ZStack(alignment: .bottomLeading) {
                        Image("blog_banner") // Ảnh cover lớn
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .overlay(Color.black.opacity(0.2))
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Câu Chuyện Làng Gốm")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            Text("Khám phá hành trình, tâm hồn và ký ức đất sét Việt")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding()
                    }
                    
                    // Danh sách bài viết
                    ForEach(blogPosts) { post in
                        Button {
                            selectedPost = post
                        } label: {
                            BlogCard(post: post)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.bottom, 30)
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedPost) { post in
                BlogDetailView(post: post)
            }
        }
    }
}

// Card blog
struct BlogCard: View {
    let post: BlogPost
    var body: some View {
        HStack(alignment: .top, spacing: 18) {
            Image(post.coverImage)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(18)
                .shadow(radius: 4)
            VStack(alignment: .leading, spacing: 6) {
                Text(post.title)
                    .font(.title3.bold())
                    .foregroundColor(.primary)
                Text(post.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 2, y: 4)
        .padding(.horizontal)
    }
}

// Chi tiết Blog
struct BlogDetailView: View {
    let post: BlogPost
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Image(post.coverImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 210)
                    .cornerRadius(24)
                    .shadow(radius: 10)
                    .padding(.top)
                Text(post.title)
                    .font(.title.bold())
                    .padding(.bottom, 3)
                Text(post.subtitle)
                    .foregroundColor(.secondary)
                Divider()
                ForEach(post.content.split(separator: "\n"), id: \.self) { line in
                    if line.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix(">") {
                        Text(line.replacingOccurrences(of: ">", with: ""))
                            .italic()
                            .font(.title3)
                            .padding(.vertical, 8)
                            .foregroundColor(.accentColor)
                    } else {
                        Text(line)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}


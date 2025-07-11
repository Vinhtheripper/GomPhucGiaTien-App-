//
//  PotteryTourView.swift
//  Ceramic
//
//  Created by Quang Vinh on 3/7/25.
//

import SwiftUI

struct PotteryTourView: View {
    @State private var selectedDate = Date()
    @State private var numberOfPeople = 2
    @State private var showBooked = false

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                // Banner image
                Image("pottery_tour_banner")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()
                    .cornerRadius(22)
                    .shadow(radius: 10)
                    .padding(.horizontal)

                // Title & Desc
                VStack(alignment: .leading, spacing: 10) {
                    Text("Trải Nghiệm Làng Gốm")
                        .font(.title.bold())
                        .foregroundStyle(LinearGradient(
                            colors: [Color("CeramicBlue"), .orange],
                            startPoint: .leading, endPoint: .trailing
                        ))
                    Text("Khám phá nghệ thuật làm gốm, tự tay tạo ra sản phẩm thủ công và tận hưởng văn hóa làng nghề truyền thống Việt Nam.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // Tour details
                HStack(spacing: 20) {
                    Label("Hướng dẫn viên bản địa", systemImage: "person.crop.circle")
                    Label("Tặng 1 sản phẩm tự làm", systemImage: "gift")
                }
                .font(.subheadline)
                .foregroundColor(.accentColor)
                .padding(.horizontal)

                // Select date & people
                VStack(spacing: 20) {
                    HStack {
                        Text("Chọn ngày:")
                        Spacer()
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .labelsHidden()
                    }
                    HStack {
                        Text("Số người:")
                        Spacer()
                        Stepper("\(numberOfPeople)", value: $numberOfPeople, in: 1...20)
                            .labelsHidden()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(18)
                .padding(.horizontal)

                // Tour schedule preview
                VStack(alignment: .leading, spacing: 8) {
                    Text("Lịch trình mẫu")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("08:30 Đón khách, tham quan làng gốm")
                        Text("09:00 Trải nghiệm nặn gốm cùng nghệ nhân")
                        Text("10:30 Tham quan xưởng gốm, check-in")
                        Text("11:30 Nhận sản phẩm, tạm biệt")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // Book button
                Button(action: { showBooked = true }) {
                    HStack {
                        Spacer()
                        Text("Đặt Tour Ngay")
                            .font(.title3.bold())
                            .padding()
                        Spacer()
                    }
                    .background(Color("CeramicBlue"))
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .shadow(radius: 8)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Tour Làng Gốm")
        .alert(isPresented: $showBooked) {
            Alert(title: Text("Đặt tour thành công!"),
                  message: Text("Cảm ơn bạn đã đăng ký trải nghiệm. Chúng tôi sẽ liên hệ xác nhận trong thời gian sớm nhất."),
                  dismissButton: .default(Text("OK")))
        }
    }
}


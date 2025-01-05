//
//  HomeView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/3.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    var body: some View {
        ZStack {
            Color.primary01.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    // 头像
                    Image("Avatar") // 请确保添加头像图片资源
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Text("Hi, Push Puttichai")
                        .foregroundColor(.white)
                        .font(.title3)
                    
                    Spacer()
                    
                    // 通知图标
                    VStack(alignment: .center) {
                        Image(systemName: "bell.fill")
                            .font(.title2)
                            .foregroundStyle(.neutral06)
                            .badge(count: 5)
                    }
                }
                .padding(.horizontal, 24)
                .frame(height: 80)
                .background(Color.primary01)
                
                // B 区域
                VStack {
                    CreditCardView(style: .strip)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(menus, id: \.self) { item in
                            MenuCardView(item: item)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(
                    RoundedCorner(radius: 30, corners: [.topLeft, .topRight])
                )
            }
        }
        
    }
    
}

#Preview {
    HomeView()
}



// 自定义形状来实现部分圆角
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

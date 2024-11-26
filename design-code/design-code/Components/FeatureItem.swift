//
//  FeatureIten.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct FeatureItem: View {
    var course:Course
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
            Spacer()
            HStack{
                Image(course.logo)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .cornerRadius(10.0)
                    .padding(9)
                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .strokeStyle(cornerRadius: 16)
//                Image("Logo 1")
//                    .resizable(resizingMode: .stretch)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 26, height: 26)
//                    .cornerRadius(10.0)
//                    .padding(9)
//                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//                    .strokeStyle(cornerRadius: 16)
            }
            Text(course.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            
            Text(course.subtitle)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
               
            Text(course.text)
                .font(.footnote)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20)
        .padding(.vertical, 10)
        .frame(height: 350)
//        .background(.ultraThinMaterial)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .cornerRadius(30)
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

#Preview {
    FeatureItem(course: courses[0])
}

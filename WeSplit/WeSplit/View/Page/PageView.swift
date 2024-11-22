//
//  PageView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/11.
//

import SwiftUI
//import UIKit

struct PageView<Page: View>: View {
    var pages:[Page]
    @State private var currPage = 0
//    var url? = "https://upload.jianshu.io/users/upload_avatars/6536095/8aa5f162-9088-48db-9bf2-4fb0a32be915.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/48/h/48/format/webp"
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currPage: $currPage)
            PageControl(numberOfPages: pages.count, currPage: $currPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
        
        AsyncImage(url: URL(string: "https://upload.jianshu.io/users/upload_avatars/6536095/8aa5f162-9088-48db-9bf2-4fb0a32be915.jpg"))//.scaledToFit()
    }
}

#Preview {
    PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
}

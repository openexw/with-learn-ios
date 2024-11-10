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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currPage: $currPage)
            PageControl(numberOfPages: pages.count, currPage: $currPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map{FeatureCard(landmark: $0)})
}

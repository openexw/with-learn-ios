//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/7.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .frame(width: 300,height: 300)
            .clipShape(Circle())
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("_DSC0790"))
}

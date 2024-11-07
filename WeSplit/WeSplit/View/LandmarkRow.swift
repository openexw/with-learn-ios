//
//  LandmarkRow.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/8.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image.resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview {
    Group{
//        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

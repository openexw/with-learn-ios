//
//  CategoryRow.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/10.
//

import SwiftUI

struct CategoryRow: View {
    var cateName : String
    var items : [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(cateName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
        
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        cateName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}

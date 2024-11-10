//
//  LandmarkView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/8.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filterMarkStar :[Landmark]{
        modelData.landmarks.filter{item in
            (!showFavoritesOnly || item.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView{
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filterMarkStar) { landmark in
                    NavigationLink {
                       LandmarkDetail(landmark: landmark)
                   } label: {
                       LandmarkRow(landmark: landmark)
                   }
                }
            }
            .animation(.default, value: filterMarkStar)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
       
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}

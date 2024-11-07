//
//  LandmarkView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/8.
//

import SwiftUI

struct LandmarkListView: View {
    var body: some View {
        NavigationSplitView{
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                   LandmarkDetail(landmark: landmark)
               } label: {
                   LandmarkRow(landmark: landmark)
               }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
       
    }
}

#Preview {
    LandmarkListView()
}

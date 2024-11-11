//
//  LandmarkDetail.swift
//  WatchLandmark Watch App
//
//  Created by 7yue on 2024/11/12.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView{
            VStack {
                CircleImage(image: landmark.image.resizable())
                //                        .frame(width: 100, height: 100)
                    .scaledToFill()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                
                Divider()
                
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}

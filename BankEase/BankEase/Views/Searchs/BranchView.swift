//
//  BranchView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/5.
//

import SwiftUI
import MapKit

struct BranchView: View {
    @State var seachText:String = ""
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
            //                .frame(maxWidth: .infinity)
                .navigationTitle("Branch")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden(false)
            
            VStack {
                HStack{
                    TextField("", text: $seachText)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .frame(width: 36, height: 36)
                                    .background(.thinMaterial)
                                    .cornerRadius(14)
                                //                                .modifier(OutlineOverlay(cornerRadius: 14))
                                    .offset(x: -46)
                                    .foregroundStyle(.secondary)
                                    .accessibility(hidden: true)
                                Spacer()
                                if !seachText.isEmpty {
                                    Button{
                                        seachText = ""
                                    } label: {
                                        Image(systemName: "xmark")
                                            .font(.caption)
                                            .foregroundStyle(.accent)
                                    }
                                }
                            }
                        )
                    
                        .foregroundStyle(.primary)
                        .padding(15)
                        .padding(.leading, 40)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 16)
                .padding(.top, 28)
                .clipShape(.rect(cornerRadius: 15))
                
             
                if !seachText.isEmpty {
                    List {
                        ForEach(branchItems, id: \.id) { item in
                            HStack{
                                Image(systemName: "mappin")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary01)
                                
                                Text(item.title)
                                    .font(.body)
                                    .foregroundStyle(.neutral01)
                                Spacer()
                                Text(item.distance)
                                    .font(.caption)
                                    .foregroundStyle(.accent)
                            }
                        }
                    }
                    .listStyle(.sidebar)
                    .listRowSeparator(.automatic)
                    .padding(0)
                    .background(Color.white)
                }
            }
        }
        //        .navigationBarBackButtonHidden(true)
        .navigationTitle("Branch")
    }
}

#Preview {
    BranchView(seachText: "sss")
}

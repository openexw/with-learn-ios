//
//  SFSymbol.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

/**
 1. spacing 用于设置容器视图中子视图间的间距，默认为 8？
 1. NavigationView
 */
struct ProfileView: View {
    @State var isDeleted:Bool = false
    @State var isPin:Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var profile: some View {
        VStack(spacing: 8){
            Image(systemName: "cloud.drizzle.circle")
                .symbolVariant(.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette) // 指定primary、secondary、tertiary颜色来渲染前景元素‌
                .foregroundStyle(.blue,.blue.opacity(0.03))
                .padding(2)
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .font(.system(size: 200))
                    // 使用 Canvas 替代
                    //                        CanvaView()
                        .offset(x:-50, y: -100)
                )
                .background(
                    CanvaAnimView()
                        .offset(x: 200, y:0)
                        .scaleEffect(0.6)
                )
            Text("7Yue")
                .font(.title.weight(.semibold))
            HStack{
                Image(systemName: "location")
                    .imageScale(.small)
                Text("China")
                //                        .foregroundColor(.secondary)
            }.foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink{
                Text("Billings")
            } label:{
                Label("Billings", systemImage: "creditcard")
            }
            NavigationLink{
                ContentView()
            } label: {
                Label("Help", systemImage: "questionmark")
                    .imageScale(.small)
            }
        }
        .accentColor(.primary) //
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    var website:some View{
        Section {
            Section {
                if !isDeleted {
                    Link(destination: URL(string: "https://apple.com")!) {
                        HStack{
                            Label("Homepage", systemImage: "house")
                                .imageScale(.small)
                            Spacer()
                            Image(systemName: "link")
                                .foregroundColor(.secondary)
                        }
                    }
                    // delete icon
                    .swipeActions(edge: .trailing, allowsFullSwipe: true){
                        Button(action: {
                            isDeleted = true
                            print("delete this item")
                        }, label: {
                            Label("Delete", systemImage: "trash")
                        })
                        .tint(.red)
                    }
                    // pin icon
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        pinBtn
                    }
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack{
                    Label("Youtube", systemImage: "tv")
                        .imageScale(.small)
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }// pin icon
            .swipeActions(edge: .leading, allowsFullSwipe: true){
                pinBtn
            }
        }
        .accentColor(.primary) //
    }
    var body: some View {
        NavigationView{
            List{
                profile
                menu
                website
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button{presentationMode.wrappedValue.dismiss()} label: {
                Text("Done")
            })
        }
    }
    
    var pinBtn: some View {
        Button(action: {
            print("pin this item")
            isPin.toggle() // isPin = !isPin
        }, label: {
            if isPin {
                Label("UnPin", systemImage: "pin.slash")
            }else{
                Label("Pin", systemImage: "pin")
            }
        })
        .tint(isPin ?.gray.opacity(0.8) :.yellow.opacity(0.8))
    }
}

#Preview {
    ProfileView()
}

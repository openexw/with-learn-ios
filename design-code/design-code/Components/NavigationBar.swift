//
//  NavigationBar.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct NavigationBar: View {
    @State var title:String = ""
    @Binding var hasScrolled:Bool
    @State var showSearch = false
    @State var showProfile = false
    @AppStorage("showModal") var showModal = false
    @AppStorage("isLogged") var isLogined = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
            //                .font(.largeTitle.weight(.bold))
            //                .modifier(AnimatableFontModifier(size: hasScrolled ? 22 : 35))
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset( y: hasScrolled ? -4 : 0)
            
            HStack(spacing: 10){
                Button{
                    showSearch = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .strokeStyle(cornerRadius: 14)
                }
                .sheet(isPresented: $showSearch){
                    SearchView()
                }
                
                Button{
                    if isLogined {
                        showProfile = true
                    }else{
                        withAnimation {
                            showModal = true
                        }
                    }
                } label:  {
                    AvatarView()
                }
                .sheet(isPresented: $showProfile, content: {
                    ProfileView()
                })
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset( y: hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationBar(title: "Featured", hasScrolled: .constant(false))
}

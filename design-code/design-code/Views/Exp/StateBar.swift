//
//  StateBar.swift
//  design-code
//
//  Created by 7yue on 2024/12/1.
//

import SwiftUI

struct StateBar: View {
    @State var show = false
    @State var showStatusBar = false
    
    var body: some View {
        ScrollView{
            if !show {
                VStack{
                    Text("Page A")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.blue.opacity(0.5))
                
                Text("Page A 展示顶部的状态栏")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.red.opacity(0.9))
            }else{
                VStack{
                    Text("Page B")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.red.opacity(0.6))
                
                Text("Notice：Page B 展示顶部的状态栏消失了")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.red.opacity(0.9))
            }
        }.onTapGesture {
            show.toggle()
            showStatusBar = true
        }
        .statusBar(hidden: showStatusBar)
        .onChange(of: show) { olderVal, newValue in
            if newValue {
                showStatusBar = true
            }else{
                showStatusBar = false
            }
        }
    }
}

#Preview {
    StateBar()
}

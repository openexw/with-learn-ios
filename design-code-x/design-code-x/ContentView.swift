//
//  ContentView.swift
//  design-code-x
//
//  Created by 薄荷 on 2024/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
            Spacer()
            HStack{
                Image("Logo 2")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .cornerRadius(10.0)
                    .padding(9)
                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .strokeStyle(cornerRadius: 16)
//                Image("Logo 1")
//                    .resizable(resizingMode: .stretch)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 26, height: 26)
//                    .cornerRadius(10.0)
//                    .padding(9)
//                    .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//                    .strokeStyle(cornerRadius: 16)
            }
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            
            Text("20 sections - 3 hours")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
               
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                .font(.footnote)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20)
        .padding(.vertical, 10)
        .frame(height: 350)
//        .background(.ultraThinMaterial)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .cornerRadius(30)
        .shadow(color:Color("Shadow").opacity(0.3),radius: 10, x: 0, y:10)
        .strokeStyle()
        .padding(.horizontal, 20)
        .background(Image("Blob 1").offset(x:250, y:-100))
        .overlay(
            Image("Illustration 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -100)
        )
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

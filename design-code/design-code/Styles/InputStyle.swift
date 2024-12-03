//
//  InputStyle.swift
//  design-code
//
//  Created by 7yue on 2024/12/3.
//

import SwiftUI


struct InputStyle: ViewModifier {
    var icon: String
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .strokeStyle(cornerRadius: 20)
            .overlay{
                Image(systemName: icon)
                    .frame(width: 36, height: 36)
                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            }
    }
}

extension View {
    func inputStyle(icon:String = "mail") -> some View{
        modifier(InputStyle(icon: icon))
    }
}

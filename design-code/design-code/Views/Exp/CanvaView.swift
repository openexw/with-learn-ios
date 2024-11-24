//
//  Canvas.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct CanvaView: View {
    var body: some View {
        HStack{
            Canvas{ context,size in
                // 文本
                context.draw(Text("HH"), at: CGPoint(x: 10, y: 20))
                // path
                context.fill(Path(ellipseIn: CGRect(x: 30, y: 30, width: 50, height: 50)), with: .color(.red))
                // asset image
                context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 85, width: size.width, height: size.width))
                
                // SF symbol
                context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 100, y: 20, width: 100, height: 106))
            }
            .padding(10)
            .frame(height: 300)
//                    .foregroundStyle(.red) // 画布所有元素设置颜色
            .foregroundStyle(.linearGradient(colors: [.red, .blue.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)) // 渐变
            .padding()
        }
//        BlobIcon()
//        Canvas { context,size in
//            context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height) ), with: .linearGradient(Gradient(colors: [.red, .blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: size.width, y: size.height)))
//        }
//        .padding()
//        .frame(width: 400, height: 400)
//            .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
   
    func path(in rect: CGRect) -> Path {
           var path = Path()
           let width = rect.size.width
           let height = rect.size.height
           path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
           path.addCurve(to: CGPoint(x: 0.6355*width, y: height), control1: CGPoint(x: 0.92554*width, y: 0.77749*height), control2: CGPoint(x: 0.91864*width, y: height))
           path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
           path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height))
           path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height), control2: CGPoint(x: 1.05906*width, y: 0.07436*height))
           path.closeSubpath()
           return path
       }
}

#Preview {
    CanvaView()
}

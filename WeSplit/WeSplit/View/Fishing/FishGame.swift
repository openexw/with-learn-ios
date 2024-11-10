//
//  FishGame.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/10.
//

import SwiftUI

struct FishGame: View {
//    @Environment(ModelData.self) var dataModel;
    
    @State private var alertIsVisible:Bool = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack{
            Text("🎣🎣🎣\n让鱼竿尽可能接近鱼")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("89米")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.top, 30)
            
            HStack(content: {
                Text("\(game.target)米").bold()
                Slider(value: $sliderValue, in: 0...100)
                Text("100米").bold()
            })
            .padding(10)
            
            Button(action: {
                print("点击了「点我」")
                alertIsVisible = true
            }, label: {
                Text("点我")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .border(.white)
                    .cornerRadius(21)
                
            })
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("你好呀！"), message: Text("滑块的值是\(roundedValue)。\n" + "你本轮获得了\(game.points(val: roundedValue))分"), dismissButton: .default(Text("真棒！")))
            })
            
        }
    }
}

#Preview {
    FishGame()
        .previewLayout(.fixed(width: 926, height: 428))
}

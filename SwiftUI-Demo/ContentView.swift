//
//  ContentView.swift
//  SwiftUI-Demo
//
//  Created by 陈亚勃 on 2019/11/8.
//  Copyright © 2019 陈亚勃. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let modelList = [ [ButtonModel.operation("AC"),ButtonModel.operation("+/-"),ButtonModel.operation("%"),ButtonModel.other("/")],
    [ButtonModel.num(7),ButtonModel.num(8),ButtonModel.num(9),ButtonModel.other("*")],
    [ButtonModel.num(4),ButtonModel.num(5),ButtonModel.num(6),ButtonModel.other("-")],
    [ButtonModel.num(1),ButtonModel.num(2),ButtonModel.num(3),ButtonModel.other("+")],
    [ButtonModel.num(0),ButtonModel.operation("."),ButtonModel.other("=")]
    ]
    

    var body: some View {
        VStack(alignment: .trailing, spacing: 8) {
            Text(verbatim: "0")
                .font(.system(size: 70, weight: .medium, design:.default))
                .foregroundColor(.black)
            NumberButtonPad(modelList: modelList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NumberButton: View {
   
    let font:Font
    let title:String
    let size:CGSize
    let titleColor:Color
    let backGroundColor:Color
    let action : ()->Void
    
    var body: some View {
        
        return Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(titleColor)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(backGroundColor)
                .cornerRadius(size.height/2)
        }
    }
}

struct NumberButtonRowView: View {
    let model:[ButtonModel]
    var body: some View {
        return HStack(spacing:8){
                ForEach(model,id:\.self){ item in
                    NumberButton(
                        font: .system(size: 18),
                        title: item.title,
                        size: item.size,
                        titleColor: item.titleColor,
                        backGroundColor: item.backColor) {
                            print(item.title)
                    }
                
                }
            }
    }
}

struct NumberButtonPad: View {
    let modelList : [[ButtonModel]]
    var body: some View {
        return VStack(spacing:8){
            ForEach(modelList,id:\.self){ model in
                  NumberButtonRowView(model: model)
              }
        }
    }
}

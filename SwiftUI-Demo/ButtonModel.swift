//
//  ButtonModel.swift
//  SwiftUI-Demo
//
//  Created by 陈亚勃 on 2019/11/8.
//  Copyright © 2019 陈亚勃. All rights reserved.
//

//import UIKit
import SwiftUI

//class ButtonModel: NSObject {
//
//}
enum ButtonModel {
    case num(Int)
    case operation(String)
    case other(String)
    
    var title:String{
        switch self {
        case .num(let n):
            return String(n)
        case .operation(let s):
            return s
        case .other(let s):
            return s
        }
    }
    
    var titleColor: Color{
        switch self {
        case .num(_):
            return .white
        case .operation(_):
            return .white
        case .other(_):
            return .white
        }
    }
    
    var backColor : Color{
        switch self {
        case .num(_):
            return Color("digitBackground")
        case .operation(_):
            return Color("operatorBackground")
        case .other(_):
            return Color("commandBackground")
        }
    }
    
    var size:CGSize{
        switch self {
          case .num(let num):
            if num == 0 {
                return CGSize(width: 88*2+8, height: 88)
            }else{
                return CGSize(width: 88, height: 88)
            }
          case .operation(_):
              return CGSize(width: 88, height: 88)
          case .other(_):
              return CGSize(width: 88, height: 88)
          }
    }
    
}

extension ButtonModel:Hashable{}

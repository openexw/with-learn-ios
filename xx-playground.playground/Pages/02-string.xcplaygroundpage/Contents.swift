import Cocoa
import SwiftUI

var greeting:String = "Hello, playground"

greeting = "" // 赋值为空字符串

// 通过构造方法
str = String()
str = String("haha")
str = String(66)
str = String(66.1)
str = String(false)
//str = String(describing: )

// 字符串组合
// 1. 使用 +
var c = "sds"
var c2 = str +" "+ c
print(c2)
// 2. 字符串差值
print("aaa \(1212)")

MemoryLayout<String>.size

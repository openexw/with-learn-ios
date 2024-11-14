import Cocoa
import SwiftUI

var str:String = "Hello, playground"

str = "" // 赋值为空字符串

// 通过构造方法
str = String()
str = String("haha")
str = String(66)
str = String(66.1)
str = String(false)
//str = String(describing: )

// 字符串组合
// 1. 使用 +
var c:String = "sds"
//var c2=str!+" "+c
//print(c2)
// 2. 字符串差值
print("aaa \(1212)")

// String 和Character 都占用 16 字节
// MemoryLayout 可以获取某个类型所站用户的内存空间，单位为字节
MemoryLayout<String>.size
MemoryLayout<Character>.size


// 字符
var e: Character = "a"
var e2:[Character] = ["H", "A", "C"] // 字符数组
var e3 = (String(e2)) // 转换成字符串
var e4 = Character("A") // 通过构造方法创建字符类型变量

// 遍历String 拆解字符
var name = "Hello"
for c in name {
    print(c)
}

// 转义字符
// \0 空白
// \' 单引号
// \" 双引号
// \u{} 通过 unicode 编码创建字符


// 方法
name.isEmpty // 判空
name.count == 0 // 字符个数
var b1 = e3 == name // 比较大小，逐个比较字符大大小

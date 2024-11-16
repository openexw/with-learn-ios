/*:
 [< Previous](@previous)            [Home](learn-xcode-playground)          [Next>](@next)
 ## 基础类型
 主要介绍以下内容：
 - 元组
 - Optional 类型
 - 类型别名
 - Int
 - Double
 - Bool
 */
import Cocoa
import SwiftUI

var greeting = "Hello, playground"

print(greeting)
//
//func add(a:Int, b:Int) -> Int {
//    return a + b
//}
//
//let s = add(a: 1, b: 12)
//
//
//class User {
//    var name:String
//    var age:Int
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//// 扩展 User 让他的打印更友好
//extension User: CustomStringConvertible {
//    var description: String {
//        get {
//            return "\(name) age is \(age)"
//        }
//    }
//}
//
//var u1 = User(name: "张三", age: 10)


// 元组：元组允许一些并不相关的类型自由组合成为新的集合类型

// 定义：指定名称
var pen:(name:String, price: Int) = ("铅笔", 2)
// 访问
print("名称：\(pen.name), 价格：\(pen.price)")

// 定义：不指定名称
var pen1:(name:String, price: Int) = ("铅笔", 2)
// 访问，通过下标访问
print("名称：\(pen1.0), 价格：\(pen1.1)")
// 分解
var (name, price) = pen1
// 第二个参数进行匿名
var (name1, _) = pen1

//======
// 可选值类型：可将普通类型包装为Optional类型，Optional类型不会独立存在，总会附着于某个具体的数据类之上。
// Optional类型是对普通类型的包装，使用时需要通过 `!` 进行拆包
// swift 中使用了一个没有赋值的变量程序会报错并停止运行。对于声明后赋值的场景，我们可以使用 可选值类型
// 若没有 ？ 下面的使用会报错
Int("a111") // 返回的是 Optional类型
var obj : String?
if obj != nil {
    // somo code
    obj! // 拆包
}

// if-let 多 Optional 值绑定
var o1:Int? = 1
var o2:Int? = 2
if let tmp1 = o1, let tmp2 = o2, tmp1 > tmp2 {
    print(tmp1, tmp2)
}
// 隐式解析：隐式解析适用于这样的场景：当我们明确某个变量初始时为nil，并且在之后使用之前一定会被赋值时，我们可以将其声明为隐式解析的可选值，再对这个变量进行使用，就不需要进行拆包操作了
// 通过 `!` 申明为隐式解析变量
var o3:Int!
o3 = 10
print(o3+1)

//======

// ====
// 类型别名
typealias orderStats = Int
// 使用 orderStats 替代 Int
var o_pay:orderStats = 1
//====



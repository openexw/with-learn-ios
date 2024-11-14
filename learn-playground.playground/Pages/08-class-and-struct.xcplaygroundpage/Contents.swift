//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// class vs struct
// - class 描述对象的一种方式
// - struct 描述数据的一种方式
// - 都可以定义属性和方法
// - struct 不具备继承特性

// 某种情况下，struct 可代替 class，但是 class 的一些高级特性是 struct 不具备的
// -


// ===== struct
// struct 和 enum 都是值类型，数据传递是会 copy 一份；
// class 是引用类型，引用类型通过引用计数来管理其声明周期
struct car {
    // 属性
    var color:String
    var pertol:Int // 油量
    // 方法
    func drive(){
        if pertol > 0 {
            pertol -= 1
        }
    }
}

// 创建实例
var c1 = car(color: "#000", pertol: 10)
// 获取属性
c1.color
c1.drive()
var c2 = c1 // 会进行 copy
// ==== class

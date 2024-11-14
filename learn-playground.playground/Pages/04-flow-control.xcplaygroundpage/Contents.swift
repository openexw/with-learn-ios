//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// ============ 三目运算符
var a = 10
var b = 11
var c = a > b ? "aa" : "b"

// 空合并运算符
var q:Int? = 8
var val:Int
val = q ?? 0 // 第一个参数必须为 Optional 类型，若不为 nil 就进行拆包；若为 nil 则返回第二个操作数

// 区间运算符
//var index:Int
//index = 10
//index > 0 && index < 10
var range1 = 0...10 // [0,10]
var range2 = 0..<10 // [0, 10)

print(range1 ~= 8) // range1 是否包含 8

// 用于循环
for i in 0...10 {
    print(i)
}

//============== 循环
var sum = 0
for _ in 0...10 {
    sum += 1
}

// 满足要求后执行
while sum < 7 {
    //    print(sum)
    sum-=1
}
print(sum)

// 先执行一次，再判断是否满足要求
repeat {
    sum -= 1
} while sum > 5

print(sum)

// ====== 分支
// if
// if-else
// switch-case case 匹配成功后自动跳出 switch 结构，与 go 的 switch 类似
switch sum {
case 1,4:
    print("ass")
case 5...10:
    print(11)
default:
    print("ass")
}

//var t = (0, 0);
//switch t {
////case (0, 1): // 完全匹配
////    print("sss")
//case (_, 1): // 选择性匹配
//    print("_,1")
//case (let a,1): // 捕获 a
//    print("a=\(a)")
//case (let a,b): // 捕获 a，b
//    print("a=\(a), b=\(b)")
//case (0...3, 0...3): // 元组元素的范围匹配
//    print("mx")
//case (let a,b) where a==b: // 元组元素的范围匹配
//}

// continue
// break
// fallthrough：不自动跳出 switch
// return
// throw：用于语句抛出异常
// guard：

func val(param: Int) {
    if param < 0 {
        return
    }
    print("other")
}

//
func val1(param: Int) {
    if param > 0 {
        print("other")
    }
}

func val2(param: Int) {
    // 守护语句
    guard param > 0 else {
        return
    }
    print("other")
}


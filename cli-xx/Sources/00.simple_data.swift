
// 常量
let a = 12
// 声明变量
var b = 2334
// 声明多个变量
var a = 0,b = 1,c = 3
// var a,b,c: Int // 添加注解类型

// 字符串
// 类型注解，
// 用于说明常量或者变量中要存储的值的类型
// 形如：var|let 变量名称:类型
var s = "hello"
var d: String
// 多行文本
let m = """
hello
H
IL
"""
var isJpg = m.hasSuffix(".jpg") // 判断是否以 .jpg 开头
isJpg.toggle() // 取反
// 字符串连接
let s1 = "hello"
let s2 = "world"
let s3 = s1 + "," + s2
print(s3)
// 字符串插值, 通过 `\(变量名)` 来占位
let s4 = "\(s1),\(s2)"


print("s3=\(s3)")
// 输出 print()
// 直接输出
print("a ....", "sdsdsd")
// 字符串插值, 通过 `\(变量名)` 来占位
print("d=\(a)")
print("x * d=\(10*2)")


// 整数
let max = UInt8.max
// 自动类型推导
// `let a = 12` a 会被推导成 Int 类型
// 长整数定义
let a = 1_000_00
let a = 100
let b = a - 10``
var c = 1000
print(c.isMultiple(of: 3)) // 判断是否是3的倍数

// 浮点数，双精度
let f1 = 1.23456789
let f2 = 1.23456789e10
print(f1, f2)

// 类型转换
print(String(b) + ",hehe")
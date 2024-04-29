/*
// 常量
let a = 12
// 声明变量
var b = 2334
// 声明多个变量
var a = 0,b = 1,c = 3
// var a,b,c: Int // 添加注解类型

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

// 输出 print()
// 直接输出
print("a ....", "sdsdsd")
// 字符串插值, 通过 `\(变量名)` 来占位
print("d=\(a)")

// 整数
let max = UInt8.max 

// 自动类型推导
// `let a = 12` a 会被推导成 Int 类型

// 类型转换
print(String(b) + ",hehe")

// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min  // maxAmplitudeFound 现在是 0

// 元组
// 元组（tuples） 把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
let http404Error = (404, "Not Found") // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
let http404Error1 = (statusCode:404, msg: "Not Found") // 给单个元素命名
// 分解元素的内容
let (staus,msg) = http404Error
// 使用 _ 忽略数据
let (staus,_) = http404Error
// 通过下表访问
status =  http404Error.0
status =  http404Error1.statusCode

// 可选类型
// 使用`可选类型（optionals）`来处理值可能缺失的情况。可选类型表示两种可能：或者有值，
// 可选类型通过:`类型?`来表示
Int("1212sd") // 由于 `1212sd` 并不是不能被转换成 Int 类型，返回的是 `Int?` 可选类型
// nil
var cc:Int? = 404 // cc 的值为 404
cc = nil // cc 现在不包含值
var anser: String? // 声明一个可选变量但是没有赋值，它们会自动被设置为 nil
// 使用 if 语句和 nil 比较来判断一个可选值是否包含值。
if anser == nil {
    // some code
     print("convanserertedNumber has an String value of \(anser!).") // 使用 ! 强制解析可选值，若 anser 为 nil 贼会报错
}


// 可选绑定
// 可选绑定（optional binding）判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
// 在 if 条件语句中使用常量和变量来创建一个可选绑定，仅在 if 语句的句中（body）中才能获取到值。
var str:String = "123"
if let num = Int(str) {
    print("\'\(str)\' has an integer value of \(num)")
} else {
    print("\'\(str)\' could not be converted to an integer")
}
// 输出“'123' has an integer value of 123”
// 若 Int(str) 返回的 Int? 包含值，则创建一个 num 的常量并将包含的值赋值给 num

// 隐式解析可选类型
var s1:String? = "s1" // 需要感叹号来获取值
var s2:String! = "s2" // 强制类型解析，不需要 ! 取值
// 强制类型解析不需要感叹号来获取值，
print( "s1=\(s1!), s2=\(s2)")
// 如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型

// 错误处理
func a () throws {

}
do {} catch {}

// 断言和先决条件
// 断言和先决条件可以强制检查你的数据和程序状态，使得你的程序可预测的中止
// 断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
assert(age >= 0) // 忽略消息
// 先决条件
assert(age >= 0)


// -------- 集合类型 ---

// --------数组&字典--------
var f = ["a", "b", "c"]
f[1] = "d" // ["a", "d", "c"]
f.append("e")

var ms = [
    "a": 1,
    "b": 3
]
ms["e"] = 12
// var ff = [] // 空数据
// var mm = [:] // 空字典
// 指定类型
// 如果要将空数组或字典分配给新变量或其他没有任何类型信息的位置，则需要指定类型。如下：
let arr: [String] = []
let dict:[String: Float] = [:]
 */

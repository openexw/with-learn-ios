/*
var a = 12
b = -a // 一元负号运算符

// 比较运算符
// 元组比较：如果两个元组的元素相同，且长度相同的话，元组就可以被比较。

// 三目运算符
let c = a > 0 ? a :-1

// 空合运算符
// 表达式 a 必须是 Optional 类型，默认值 b 的类型必须要和 a 存储值的类型保持一致。
a ?? b ？// 若 a 为空，则返回为 b，如设置默认值
a != nil ? a! : b // 等价于 a ?? b
let s1: String?
let s2 = "red"
let s3 = s1 ?? s2 // s3 为 red

// 区间运算法
// 闭区间运算法[1,5]
for item in 1...5 {}
// 半区间运算法 [1, 5)
let names = ["Anna", "Alex", "Brian", "Jack"]
for item in 0..<names.count {} 
// 单侧区间
for item in names[...2] {} // ["Anna", "Alex", "Brian"]
for item in names[2....] {} // ["Brian", "Jack"]

*/

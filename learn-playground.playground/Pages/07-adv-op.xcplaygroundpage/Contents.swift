
// 位运算符
// &
// |
// ~
// ^
// <<
// >>

//溢出运算符
var b:UInt8 = 255 // UInt8 最大值为 255
//b = b+1 // 会报错
// 使用溢出操作符
b = b &+ 1 // 0
b = b &- 1 // 255
b = b &* 2 // 254

// 重载
// 实现不同类型的数据的加法函数
// 开发者只需要记住一个 addFn 即可
func addFn(a:Int, b:Int) -> Int {
    a + b
}
func addFn(a:Double, b:Double) -> Double{
    a+b
}
func addFn(a:String, b:String) -> String{
    a+b
}

// 运算符重载：为已经存在的系统运算符扩展新的功能
struct User {
    var name:String
}
// 重载 + ，扩展新功能
func +(u1:User, u2: User) -> User {
    return User(name: u1.name+u2.name)
}
// 自定义运算符
//prefix 前缀：++n
//infix 中缀: a++b
//postfix 后缀 c++
// 1. 声明要定义的运算符
// 自定义前缀运算符
prefix operator ++
// 2. 实现
prefix func ++(p: Int) -> Int {
    return p+1
}
++5 //6


//precedencegroup 调整自定义运算符的优先级

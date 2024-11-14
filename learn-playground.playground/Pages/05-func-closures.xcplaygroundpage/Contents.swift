// 函数三要素：参数、返回值、函数名
// func methodName(params1, params2, ...) -> returnVal { // 实现 }

// v 是函数 f1 的内部命名
func f1(v:Int) -> Int? {
    return v+1
}

// 返回 Optional 类型，然后通过 if-let 结构进行安全性检查
// 调用函数 f1 中的 v 为外部命名
if let v = f1(v:10) {
    print("aaa: \(v)")
}

// 添加匿名变量标识 `_` 省略外部命名
func f2(_ v:Int) -> Int?{
    return v+33
}
if let v = f2(11) {
    print(v)
}

// v2 设置默认值
// v3 参数个数不定：`...`
func f3(v1:Int, v2:Int=10, ids:Int...) {
    
}

// 函数参数为值类型时，则将原值复制为一份常量，且函数内部不可修改
// 错误示范：
//func f3(v: Int) {
//    v = 12
//    print(v)
//}

// 若需要在函数内部修改传参的值，可以声明为 `inout` 类型
// 传参时需要使用 & 取地址符
func f4(v: inout Int) {
    v = 32
}

var a = 10
f4(v: &a)
print(a) // 32


// 声明函数类型变量
// 函数的变量类型由参数和返回值决定。
var addFunc :(Int,Int) -> Int
addFunc = {(a:Int, b:Int) in return a+b} // 闭包方式
addFunc(10, 20)

// 函数也可以作为另一个函数的参数
func f5(p:(Int,Int)->Int) {
    print(p(1,10))
}
f5(p: addFunc)

// 函数作为返回值
func f6() -> (Int,Int) -> Int {
    return {(a:Int, b:Int) in
        return a + b
    }
}
addFunc = f6()
addFunc(1,4)


// ======= 闭包
// 闭包作用：传递功能代码和处理回调结构

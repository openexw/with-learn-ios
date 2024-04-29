let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// 闭包写法
// 闭包语法：
// { (parameters) -> return type in
//     statements
// }
// 闭包的函数体部分由关键字 in 引入
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 可以简写成一行
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

// 根据上下文进行类型推导
// sorted 是被一个String数组调用，因此参数是 `(String, String) -> Bool` 类型的函数
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
// 单表达式闭包的隐式返回
// 单行表达式闭包可以通过省略`return`关键字来隐式返回单行表达式的结果
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// 参数名缩写
// Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数
reversedNames = names.sorted(by: { $0 > $1 } )

// 运算符方法
// 由于 String 类型定义了关于运算符 > 的实现方式，可以简单地传递一个大于号，系统自带的那个字符串函数的实现
reversedNames = names.sorted(by: >)

// 尾随闭包
//尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用
func ask (closure: ()-> Void ){
}

// 非尾随闭包
ask(closure: {
// 闭包主体
})
// 尾随闭包
ask(){
// 闭包主体
}

// 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
reversedNames = names.sorted() { $0 > $1 }
// 省略为
reversedNames = names.sorted { $0 > $1 }

// 值捕获

// 闭包逃逸
// 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸
// 通过标记 `@escaping` 来指明这个闭包是允许“逃逸”出这个函数的。
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// 自动闭包
// 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(names.count)
// 打印出“5”
let customerProvider = { names.remove(at: 0) }
print(names.count)
// 打印出“5”
// 真正执行闭包
print("Now serving \(customerProvider())!")
// 打印出“Now serving Chris!”
print(names.count)
// 打印出“4”



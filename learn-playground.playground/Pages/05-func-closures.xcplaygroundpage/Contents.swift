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
// 标准结构：`{(参数列表)-返回值 in 闭包体}`
// in 分割参数列表返回值和闭包体
// 闭包的返回值是可以省略的，
var c = {(a:Int)-> Int in
    return a * a
}
//若没有返回值类型，闭包会自动将 return 的数据类型作为返回值类型。以上 c 可简写成如下：
var c1 = {(a:Int) in {
    return a * a
}}

func sortBy(arr: inout Array<Any>, by: (Any, Any)->Bool) -> Array<Any> {
    for i in arr.indices {
        if i == arr.count - 1 {
            break
        }
        for j in 0...((arr.count-1)-i-1) {
            if by(arr[j],arr[j+1]) {
                
            }else{
                arr.swapAt(j,j+1)
            }
        }
    }
    return arr
}

// as! 类型装换
// Any 任意类型
var arr : Array<Any> = [1,20, 5,7,19]
sortBy(arr: &arr, by: {(i:Any, nextI:Any)->Bool in
    return (i as! Int ) < (nextI as! Int)
})
print(arr)
// 优化写法：
// 1. 闭包函数作为参数时的参数类型可以省略，函数申明时已经指定了参数，编译器可以自行推断
sortBy(arr: &arr, by: {(i,j)->Bool in
    return (i as! Int ) < (j as! Int)
})
// 2. 闭包只有一行代码，可以忽略 return（只有将闭包作为函数的参数才能简化）
sortBy(arr: &arr, by: {(i,j)->Bool in
    (i as! Int ) < (j as! Int)
})
// 3. 闭包函数的参数列表会自动创建一组参数，参数名的结构为 $0、$1 ...
sortBy(arr: &arr, by: {
    ($0 as! Int ) < ($1 as! Int)
})

// === 后置闭包
sortBy(arr: &arr){
    ($0 as! Int ) < ($1 as! Int)
}
// 若只有一个参数列表且参数是一个闭包尅性的参数，可以直接省略参数列表
func c2(c : (Int, Int)->Bool) {
    
}
// 忽略参数列表
// 原来
c2(){
    $0 > $1
}
// 忽略后
c2{
    $0 > $1
}
// ===  逃逸闭包：所谓逃逸闭包，是指函数内的闭包在函数执行结束后在函数外依然可以使用，非逃逸闭包是指当函数的生命周期结束后，闭包也将被销毁，
// 即：非逃逸闭包只能在函数内部使用，在函数外部不能够使用。默认定义的闭包都是非逃逸类型
// 逃逸闭包常用于异步操作中，比如后台执行一个请求完成后执行闭包回调

// 自动闭包：可以对简单闭包的自动生成
// 条件：
// 1. 闭包不能有参数
// 2. 调用函数传参时闭包只能有一句表达式，闭包的返回值即为表达式的值，自定闭包由 `@autoclosure` 来声明
func f7(closure: @autoclosure ()->Bool){}
f7(closure:10-1+23>1)

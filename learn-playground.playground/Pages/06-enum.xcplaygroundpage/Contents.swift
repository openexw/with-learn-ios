// 定义
enum FirstName {
    case Ran
    case Wang
    case Zhou
}

enum FirstName1 {
    case Ran,Wang,Zhou
}

// 使用
var fr:FirstName // 定义
fr = FirstName.Ran // 赋值
fr = .Wang // 省略枚举值的类型
// switch-case 结构选择
switch fr{
case .Ran:
    print(fr)
case .Wang:
    print(fr)
case .Zhou:
    print(fr)
}


// === 原始值
//指定枚举值的类型
enum orderState:Int {
    case unpay = 1
    case paied = 2
    case sent = 3
}

// 获取变量 s 的原始值
var s = orderState.paied
var rawVal = s.rawValue // 2

// 初始化
var st = orderState(rawValue: 3) // 返回一个 Optional 类型，若为 4 则 st 为 nil


// === 相关值
enum Shape {
    case circel // 圆
    case rect // 矩形
    case triangle // 三角形
}
// 定义不同形状拥有不同的参数
// 这个参数列表被称为相关值
enum Shape1 {
    case circel(point:(Double,Double), radius: Double) // 圆
    case rect(point:(Double, Double), width:Double, height:Double) // 矩形
    case triangle(p1:(Double, Double),p2:(Double, Double), p3:(Double, Double)) // 三角形
}
// 使用
var c = Shape1.circel(point: (0,0), radius: 10)
var r = Shape1.rect(point: (0,0), width: 100, height: 20)
var t = Shape1.triangle(p1: (0,0), p2: (10, 10), p3: (100, 45))

// switch-case 捕获枚举值的相关值
func shape(_ param: Shape1) {
    switch param{
    case let .circel(point, radius):
        print("圆：\(point), r: \(radius)")
    case let .rect(_, width, height):
        print("矩形：w：\(width), h: \(height)")
    case let .triangle(p1, p2, p3):
        print("三角形：p1：\(p1), p2: \(p2), p3: \(p3)")
    }
}
shape(c)
shape(t)
shape(r)

// === 递归枚举: 使用递归的方式来进行数据描述
//递归：实现一个 5! 阶乘
func factorialFn(v : Int) -> Int {
    let tmp =   v - 1
    if tmp > 0 {
        return factorialFn(v: tmp) * v
    }else{
        return 1
    }
}
factorialFn(v: 5)

// 递归枚举
enum Exp {
    case add(a:Int, b:Int)
    case sub(a:Int, b:Int)
    case mul(a:Int, b:Int)
    case div(a:Int, b:Int)
}
var e1 = Exp.add(a: 1, b: 2)
var e2 = Exp.sub(a: 1, b: 2)
var e3 = Exp.mul(a: 1, b: 2)
var e4 = Exp.div(a: 1, b: 2)

// 以上没办法表示：((5+5)*2-8)/2
// 分析复合表达式：将单运算表达式作为计算的参数传入另一个单运算表达式
// `indirect` 表示这个枚举值是可递归的，
enum Exp1 {
    case num(a:Int)
    indirect case add(a:Exp1, b:Exp1)
    indirect case sub(a:Exp1, b:Exp1)
    indirect case mul(a:Exp1, b:Exp1)
    indirect case div(a:Exp1, b:Exp1)
}
// 表示 ((5+5)*2-8)/2
var num5 = Exp1.num(a: 5)
var num2 = Exp1.num(a: 2)
var num8 = Exp1.num(a: 8)
var ex1 = Exp1.add(a: num5, b: num5)
var ex2 = Exp1.mul(a: ex1, b: num2)
var ex3 = Exp1.sub(a: ex2, b: num8)
var ex4 = Exp1.div(a: ex3, b: num2)

// 递归函数
// 若所有枚举值都是可递归的，整个枚举都可声明为可递归
indirect enum Exp2 {
    case num(a:Int)
    case add(a:Exp1, b:Exp1)
    case sub(a:Exp1, b:Exp1)
    case mul(a:Exp1, b:Exp1)
    case div(a:Exp1, b:Exp1)
}

func expFn(v:Exp1) -> Int {
    switch v{
    case let .num(a):
        return a
    case let .add(a, b):
        return expFn(v: a) + expFn(v: b)
    case let .sub(a, b):
        return expFn(v: a) - expFn(v: b)
    case let .mul(a, b):
        return expFn(v: a) * expFn(v: b)
    case let .div(a, b):
        return expFn(v: a) / expFn(v: b)
    }
}
expFn(v: ex4)



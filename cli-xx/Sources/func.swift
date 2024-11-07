
func greter(str:String) -> String{
    return "Hello, "+str+"!"
}

// 利用元组返回多个值
func minMax(array: [Int]) -> (min Int,max Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// var b = minMax(array: [1, 10, -90, 12])
// b.max, b.min

// 返回可选元组
func minMax(array: [Int]) -> (min Int,max Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let b = minMax(array: [1, 10, -90, 12]) {
    b.max, b.min
}


// 默认值，设置 a 默认为 1
func add(a Int, b Int = 1) -> Int {
    return a +b
}
// 忽略参数
func div(_ Int, b Int) -> Float? {
    if b == 0 {
        return nil
    }
    // return a / b
    return 0
}
// 可变参数
func avg(nums:Double...) -> Double {
    var total: Double = 0
    for number in nums {
        total += number
    }
    return total / Double(nums.count)
}

avg(1, 2, 3, 4,6)

// 输入输出参数
// 函数参数默认是常量，若对参数进行修改会报错，可以通过 inout 修饰来修改该值
// > 输入输出参数不能有默认值，而且可变参数不能用 inout 标记
func swap(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
var a1 = 2
var b1 = 3
swap(&a1, &b1)

// 函数类型
// (Int, Int) -> Int 就是 (a Int, b Int = 1) -> Int 的函数类型
var add1:(Int, Int) -> Int = add
// 函数类型作为参数
func fnM(_ fn: (Int, Int)->Int, _ a:Int, _ b:Int){
    print("fn=\(fn(a,b))")
}
fnM(add, 1, 5) // 6
// 函数类型作为返回值

// -----闭包-----

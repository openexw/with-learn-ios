/*:
 [< Previous](@previous)            [类和结构体](08-class-and-struct)          [Next>](@next)
 ## 类和结构体
 主要描述
 */

import Foundation

var greeting = "Hello, playground"

/*:
 ## class vs struct
 - class 描述对象的一种方式
 - struct 描述数据的一种方式
 - 都可以定义属性和方法
 - struct 不具备继承特性
 - class 需要提供构造方法，而 struct 不需要
 
 
 // 某种情况下，struct 可代替 class，但是 class 的一些高级特性是 struct 不具备的，如继承
 // -
 
 
 ## struct
 // struct 和 enum 都是值类型，数据传递是会 copy 一份；
 // class 是引用类型，引用类型通过引用计数来管理其声明周期
 ### 哪些场景下使用 struct：
 1. 只有少量的简单数据类型的属性
 2. 数据类型在传递时需要以复制的方式进行
 3. 数据类型中的所有属性在传递时需要以复制的方式进行
 4. 不需要继承
 */
struct car {
    // 属性
    var color:String
    var pertol:Int // 油量
    // 方法
    func drive(){
        if pertol > 0 {
            //            pertol -= 1
        }
    }
}

// 创建实例
var c1 = car(color: "#000", pertol: 10)
// 获取属性
c1.color
c1.drive()
var c2 = c1 // 会进行 copy
/*: class
 -  特性：继承
 
 >1. 不被任何类继承的类称为基类
 >2. 继承而来的类被称为子类
 >3. 其锁继承的类被称为父类
 */
public class MyCar {
    var color:String
    var price:Double
    
    func info (){
        print("this car price is \(price) color is \(color)")
    }
    init(color: String, price: Double) {
        self.color = color
        self.price = price
    }
}


var ci1 = MyCar(color: "#f00", price: 112.0)
ci1.info()

// 类是引用类型：类的实例不是进行传递是不会产生复制行为
// 对属性的修改会影响到原始变量
var ci2 = ci1
ci2.color = "#0f0"
ci2.info() // this car price is 112.0 color is #0f0
ci1.info() // this car price is 112.0 color is #0f0

// override：覆写，将继承于父类的方法进行新的实现
// super：可用于调用父类的方法
// final：修饰某些终极的属性、方法或类。被 final 修饰的属性和方法不能被覆写

//: 值类型比较时使用 `==`，引用类型比较时使用 `===`,如:
ci2 === ci1 // true
/*: # 属性和方法
 ## 存储属性
 存储属性描述存储值，计算属性用于描述计算过程并获取计算结果。
 
 **值类型实例**：由常量定义的，其中的变量属性不可修改
 */

struct point {
    var x: Double
    var y:Double
}
let p = point(x: 1.1, y: 12.0)
// p.x = 10 // 会报错

//: **引用类型实例**：无论是有常量还是变量定义，都可以修改变量类型属性

class pointA {
    var x: Double
    var y:Double
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
let p2 = pointA(x: 10, y: 11)
p2.x = 100


/*:*延时存储属性**：不进行构造和初始化，只有调用时才完成初始化和构造。
 - 主要用于耗时较长的数据场景
 - 线程不安全
 */

class User {
    let name:String
    //延迟存储属性
    lazy var location: point = point(x: 1.1, y: 12.0)
    init(name: String) {
        self.name = name
    }
}
var u = User(name: "Jack")
// 使用 localtion 时才完成了 point 的初始化
u.location

/*:
 ## 计算属性
 可以由其他属性通过计算而得来的属性。
 - get 方法是必须的
 - set 方法是可选的，默认通过 newValue 为参数传入，可通过 `set(val)` 自定义名称
 */
class Cirle {
    var r:Double
    // 计算属性
    var l: Double {
        get{
            return 2*r*Double.pi
        }
        set {
            // set
            // set(val) { // 设置自定义名称
            // 将外界所设置的值默认通过 newValue 传入，也可以设置自定义名称
            r = newValue/2/Double.pi
        }
    }
    init(r: Double) {
        self.r = r
    }
}
var cirle = Cirle(r: 10)
cirle.l // 获取周长
cirle.l = 12 // 设置周长
cirle.r
/*:
 ## 只读属性
 > 当只有 get 没有 set 时该计算属性是只读的
 
 若只读可以简写为：
 ```swift
 var l: Double{
 return  2*r*Double.pi
 }
 ```
 ## 属性监听器
 用于监听存储属性赋值的过程。只有初始化第二次为属性赋值时，属性监视器才会被调用
 > 只有存储属性才可以设置属性监视器
 */

class Teacher{
    var name : String{
        willSet { // 将要被赋值时调用
            print("将要设置为：\(newValue)")
        }
        didSet { // 已经被赋值后调用
            print("old name is: \(oldValue)")
        }
    }
    init(name: String) {
        self.name = name
    }
}
var t = Teacher(name: "Jack") //不会打印
/*:第二次赋值时打印，内容如下
 - Example:
 ```
 将要设置为：Macl
 old name is: Jack
 ```
 */
t.name = "Mack"

/*:
 ## 属性包装饰器
 实现计算属性计算过程的复用
 */
class Member {
    private var mame:String
    private var age:Int
    
    var memName:String {
        get {
            return self.mame
        }
        set {
            // 检查逻辑
            if newValue.count == 0 {
                self.mame = "default"
            }else {
                self.mame = newValue
            }
        }
    }
    init(mame: String, age: Int) {
        self.mame = mame
        self.age = age
    }
}
//: 优化代码，让检查空值逻辑进行复用
// 定义属性包装器
@propertyWrapper
struct ThanZero{
    private var num:Int
    init() {
        self.num = 0
    }
    var wrappedValue: Int {
        get {
            return self.num
        }
        set {
            if newValue == 0 {
                self.num = 0
            }else {
                self.num = newValue
            }
        }
    }
}
class Member1 {
    private var mame:String
    private var age:Int
    init() {
        self.mame = ""
        self.age = 0
    }
    // 使用属性包装器
    @ThanZero var memAge:Int
}
/*:
 ## 实例属性和类属性
 - static：静态属性，子类可以通过 override 对静态属性覆写
 - 允许子类对其计算方法进行覆写，需要用到 class 关键字申明
 */
class PClass {
    static var cName = "parend Class"
    static var subName :String {
        return "sub"+cName
    }
    // 允许子类对其计算方法进行覆写，需要用到 class 关键字申明
    class var cSubName:String {
        return "class "+subName
    }
}
class SClass:PClass {
    override class var cSubName:String {
        return "new name"
    }
}
SClass.cSubName // new name

/*:
 实例方法 vs 类方法
 - 类方法是关联这个类型的，被整个类型共享
 - 实例方法由类型的实例进行调用
 */
struct Point {
    var x:Double
    var y:Double
    // 实例方法
    // 值类型默认不能对属性进行修改，可以使用 `mutating` 关键词修饰实例方法才能对属性进行修改
    mutating func move(x:Double, y:Double)  {
        self.x = x
        self.y = y
    }
    // 调用：
    //    var p1 = Point(x: 1, y: 2)
    //    p1.move(x: 2, y: 10)
    
    
    // 类方法
    static let name = "default"
    static func printName(){
        print("name is \(self.name)")
    }
    // 调用：Point.printName()
}

// 实例方法的调用
var p1 = Point(x: 1, y: 2)
p1.move(x: 2, y: 10)
// 类方法的调用
Point.printName()

/*: ## 下标方法
 通过实现 subscript
 */
class MyArr {
    // 定义一个二维数组
    var arr:Array<Array<Int>>
    init(arr: Array<Int>...) {
        self.arr = arr
    }
    subscript(idx1:Int, idx2:Int) -> Int {
        set {
            arr[idx1][idx2] = newValue
        }
        get {
            return arr[idx1][idx2]
        }
    }
}

var a = MyArr(arr: [1,3,4], [21,5,6])
a[0,1] // 3，不使用下标方法 arr[0][1]

/*:
 # 构造方法和析构方法
 - 构造方法：完成实例构造的方法。任何类至少有一个构造方法
 - 析构方法：一个实例被销毁和释放的过程
 
 构造方法嵌套
 
 覆写：子类对父类的方法的重新实现
 重载：使用已有方法相同的方法名，但是通过设置不同的参数个数和参数名、参数类型爱实现新的方法
 */

class Student {
    var age:Int = 0
    var name:String = ""
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    // init 嵌套
    convenience init() {
        self.init(age: 10, name:"Jack")
    }
    // 便利构造方法：必须调用当前类的其他构造方法，并最终调用指定构造方法
    convenience init(age:Int) {
        // 调用指定构造方法
        self.init(age: 10, name:"")
    }
}

var stu = Student() // 会调用 init() 方法
print("name: \(stu.name), age: \(stu.age)")

class SpecialStudent: Student {
    enum Special {
        case disabilit // 残疾
        case monitor // 班长
        case sick // 生病了
    }
    var specialType:Special = .disabilit
    init(typ:Special) { // 重载
        self.specialType = typ
        // 重载父类方法
        super.init(age:10, name:"JHac")
    }
    override init(age: Int, name: String) { // 覆写
        super.init(age:age, name:name)
        self.specialType = Special.disabilit
    }
    
    // 析构方法
    deinit {
        print("马上被销毁了")
    }
}

/*:
 [< Previous](@previous)            [类型装换与泛型](10-cast-type-and-generics)          [Next>](@next)
 ## 类型装换
 - `is` 判断类型，返回一个 Bool 值
 
 引用类型：
 - 子类检测父类，ok
 - 父类检测子类，Failed
 */
//var str = "heh"
//if str is String {
//    print("is string")
//}

/*:
 `as` 进行类型转换
 - `as?`：比较安全的转换方式，结果为 Optional 值
 - `as!`：强制转换，转换失败则会运行时错误，程序崩溃
 */
class MyClass{
    var name:String?
    var age:Int?
}
class MyClassOne:MyClass {
    var count:Int?
}
class MyClassTwo{}
var c1 = MyClass()
var c2 = MyClassOne()

var arr:[MyClass] = [c1, c2]
for obj in arr {
    if obj is MyClassOne {
        // 强转为 MyClassOne
        //        print( (obj as! MyClassOne).count!)
    }
    //    if obj is MyClass {}
}

/*:
 ## Any and AnyObject
 AnyObject：通用引用类型 并不能用来存放 Struct 和 enum 等类型的值
 Any：任意值，可以存放值类型和引用类型
 */
var c3 = MyClassTwo()
var arr2:Array<AnyObject> = [c1, c2, c3]
var arr3:[Any] =  [c1, c2, c3, arr2, 1, 1.0, false, (1,2)]
/*:
 ## 泛型
 表达一种未定的数据类型，如参数类型不定
 
 */
func swap<T>(a: inout T, b:inout T) {
    (a,b) = (b,a)
}

var a = 1
var b = 2
swap(a:&a, b:&b)
print("a=\(a), b=\(b)")

/*:
 ### 对泛型进行约束
 */

//:  1. 通过继承基类或者遵守协议来约束
// 只要MyClass 以及子类才能称为栈中元素
struct Stack<ItemType:MyClass> {
    var items:[ItemType] = []
    mutating func push(item: ItemType) {
        self.items.append(item)
    }
    mutating func pop() -> ItemType {
        return self.items.removeLast()
    }
}

// 1.
//protocol MyProt{
//    // 实现协议时才能执行类型
//    associatedtype ItemType
//    var param:ItemType {set get}
//    func printItem(p:ItemType) -> Void;
//}
//
//class Stack1:MyProt {
//    var param: Int{
//        get {
//            return 0
//        }
//        set {}
//    }
//    func printItem(p:ItemType) -> Void{
//        printItem(p)
//    }
//}
// 2. where 实现约束
class StackTC<T,C> where T:BinaryInteger,C:BinaryInteger {
    var p1:T
    var p2:C
    init(p1:T, p2:C){
        self.p1 = p1
        self.p2 = p2
    }
}

/*:
 ## 扩展与协议
 
 ### 扩展
 Swift 语言中的扩展支持的功能：
 1. 添加计算属性
 2. 定义示例方法和类型方法。
 3. 定义新的构造方法。
 4. 定义下标方法。
 5. 定义嵌套类型。
 6. 使一个已有的类型遵守协议。
 7. 对协议进行扩展、添加新的属性或方法约定
 
 使用 extension 关键词进行定义
 */
//
extension MyClass {
    // 新增一个构造方法
    convenience init(name:String?, age:Int?) {
        self.init()
        self.name = name
        self.age = age
    }
    // 添加新增计算属性
    var nameAndAge:String {
        //        if name != nil {
        //            return "name is \(name!)"
        //        }
        if let n = name,let a = age {
            return "name is \(n), age is \(a)"
        }
        return ""
    }
    // 添加实例方法
    func logName() -> String?{
        return self.name
    }
    // 添加类方法
    class func logClassName(){
        print("MyClass")
    }
}
var cls1 = MyClass(name: "Java", age: 10) // 新的构造方法
print(cls1.nameAndAge) // 计算属性
print(cls1.logName()) // 调用实例方法
MyClass.logClassName() // 调用类方法

//: 对值类型进行扩展时，可以呀使用 mutating 关键词来进行修饰
extension Int {
    mutating func change(){
        self = self*self
    }
}
var i = 3
i.change()
print(i)// 9

/*:
 ### 协议-Protocol
 > 类似与接口
 
 1. 协议只定义属性（可以是存储属性也可是计算属性）和一些方法的申明
 使用扩展来使某个类遵守一个协议
 */
protocol UserProtocool{
    var name:String{get} // 只读属性
    var age:Int{get set} // 读写
    var nameAndAge1:String{get} // 计算属性
    static var className:String{get} // 静态属性
    func GetUsername() ->String;
}
class MyUser{
    var name = ""
    var age = 0
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}

extension MyUser:UserProtocool {
    var nameAndAge1:String {
        get{
            return "name is \(name), age is \(age)"
        }
    }
    static var className:String {
        get {
            return "MyClass"
        }
    }
    func GetUsername() ->String {
        return name
    }
}
var cls2 = MyUser(name: "JJ", age: 45)
print(cls2.nameAndAge1)

// 协议可作为一个集合的元素类型
var arr:[UserProtocool]
// 协议和类具有相同的继承语法，一个协议继承了另一个协议，他就会拥有父协议的属性和方法
protocol AdminUserProtocool:UserProtocool {
// 继承了 UserProtocool 的属性和方法
}

// 协议可以被类和结构体遵守，若此协议只能被类遵守，可以通过 class 关键字修饰
@objc protocol ToBUserProtocool:class{
// 使用 optional 约定某个属性或者方法是否可以被实现，同时整个协议都需要加上 @objc
    optional func log();
}

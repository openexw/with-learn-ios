// 类支持的附加功能是以增加复杂性为代价的。
// 作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。

// 大多数自定义数据类型都会是结构体和枚举

// 类、结构体命名：
// 使用 UpperCamelCase 这种方式来命名类型
// 使用 lowerCamelCase 这种方式来命名属性和方法
//struct User {
//    var id Int
//    var name String
//    var age Int
//}
//
//// 
//class UserView {
//    var user = User() // 属性类型被推断为 User
//    var name:String?
//    var hasBirthday:Bool?
//}
//
//// 结构体和类都使用构造器语法来创建新的实例
//let uv = UserView()
//// 属性访问
//uv.user.id
//// 属性复制
//uv.hasBirthday = true

//struct User {
//    var width = 0
//    var height = 0
//    var id = 0
//}

//
struct User {
    var id:Int
    var name:String
    var age:Int
}

// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。
// 类实例没有默认的成员逐一构造器
// Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）、字典（dictionary）和结构体（Struct），都是值类型，其底层也是使用结构体实现的。
// Swift 中所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型的属性，在代码中传递的时候都会被复制。
// 值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。即内存地址会复制值到一块新的内存空间。
// 引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，使用的是已存在实例的引用，而不是其拷贝。即使用的是相同内存空间（类似于指针）。
class UserView {
//    var user = User(id: 1, name: "Jhon", age: 12)
//    var hasBirthday:Bool?
    var id = 0
    var name = ""
}

func aa (){
    var uv = UserView()
    // 访问属性
    print("UserView, user_id=\(uv.id)")
    uv.id = 10 // 赋值
    
    // 引用类型
    var u = UserView()
//    u: UserView = {
//      id = 0
//      name = ""
//    }
    u.id = 100
//    $R1: UserView = {
//      id = 100
//      name = ""
//    }
    let u1 = u
//    u1: UserView = {
//      id = 100
//      name = ""
//    }
     u1.id=101
//    $R2: UserView = {
//      id = 101
//      name = ""
//    }
//    u
//    $R3: UserView = {
//      id = 101
//      name = ""
//    }
// 将 u 赋值给 u1 后，修改 u1.id 的值，u 的值也发生了改变
// u 和 u1 引用的是同一个 UserView 实例
    
// 判定两个常量或者变量是否引用同一个类实例有时很有用。提供了恒等于（===、!==）
// === 表示两个类类型（class type）的常量或者变量引用同一个类实例。
    if u === u1 {
        print("u ")
    }
}

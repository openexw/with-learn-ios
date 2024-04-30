//定义
// 语法:
//enum SomeEnumeration {
//    // 枚举定义放在这里
//}

enum fruit {
    case apple,banana
}

var f =fruit.apple
f = .banana // 当枚举一旦声明，再次为其赋值可以省略枚举类型名

// 使用 switch 枚举所有类型
// switch 语句必须穷举所有情况。若忽略其中一个会无法通过编译，强制穷举确保了枚举成员不会被意外遗漏。
// 可以提供一个 default 分支来涵盖所有未明确处理的枚举成员
switch f {
case .apple:
case .banana:
default:
}

// 遍历成员
// 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。
enum UserType: CaseIterable {
    case a,b,c
}
let cnt = UserType.allCases.count
for item in UserType.allCases {
    print("item=\(item)")
}

// 关联值

// 原始值
// 原始值的隐式赋值
// 当使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为 0。
// 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称
// 下面的实例中，mercury 为 1，venus 为 2 依次类推
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let p = Planet.mercury.rawValue // 1

enum Fruit: String {
    case apple,banana
}
let fruit = Fruit.apple.rawValue

// Fruit(rawValue: )
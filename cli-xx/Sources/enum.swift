//
//  File.swift
//  
//
//  Created by 薄荷 on 2024/4/29.
//

//import Foundation

//定义
//  每个枚举定义了一个全新的类型，枚举类型以大写字母开头
// 语法:
//enum SomeEnumeration {
//    // 枚举定义放在这里
//}

// 多个成员值可以出现在同一行上，用逗号隔开
enum Planet{
    case f, a,e
}
var p = Planet.f
// `p` 的类型可以被 `Planet` 的某个初始化值给推算出来，可以使用更简短的点语法将其设置为另一个 Planet 的值：
p = .a

// 匹配枚举值
// 在判断一个枚举类型的值时，switch 语句必须穷举所有情况，如果忽略了某一个值会编译报错
// 可以提供 `default` 来避免强制穷举（不关心某些值）
switch p {
case .f:
case .a:
case .e:
default:
}

// 遍历
// 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
// 获取枚举的数量
let numberOfChoices = Beverage.allCases.count
// 通过 `.allCases` 获取所有的枚举成员
for beverage in Beverage.allCases {
    print(beverage)
}

// 关联值
enum Barcode {
	case upc(Int, Int, Int, Int) // 条形码，由一组数据组成
	case qrCode(String) // 二维码，一个字符串组成
}

// 原始值
// 原始值可以是字符串、字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。

// 原始值的隐式赋值。
// 当使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为 0。
// 原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。每个枚举成员的隐式原始值为该枚举成员的名称
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// CompassPoint 的原始值为 "north" ...
enum CompassPoint: String {
    case north, south, east, west
}

let earthsOrder = Planet.earth.rawValue // earthsOrder 值为 3
let sunsetDirection = CompassPoint.west.rawValue // sunsetDirection 值为 "west"
// 使用 rawValue 初始化枚举值
let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet 类型为 Planet? 值为 Planet.uranus

// 原始值 vs 关联值
// 原始值是在定义枚举时被预先填充的值，对于一个特定的枚举成员，它的原始值始终不变。
// 关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。

// 递归枚举
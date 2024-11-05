//
//  File.swift
//  
//
//  Created by 7yue on 2024/4/27.
//

//import Foundation

//一个字典的 Key 类型必须遵循 Hashable 协议
var namesOfIntegers: [Int: String] = [:] // 创建空字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] // 字面量创建字典

//airports.isEmpty
airports["XYZ"] = "sdd" // 等价于

airports.updateValue("sddd", forKey: "XYZ")

// 字典
var m1 = [String: Int]() // 空字典
var ms = [
    "a": 1,
    "b": 3
]
ms["e"] = 12 // add data
// var ff = [] // 空数据
// var mm = [:] // 空字典
// 指定类型
// 如果要将空数组或字典分配给新变量或其他没有任何类型信息的位置，则需要指定类型。如下：
let arr: [String] = []
let dict:[String: Float] = [:]
// 获取字典中的值
print(msp["a", default: 0]) // 若 "a" 不存在，则返回 0


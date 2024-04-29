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





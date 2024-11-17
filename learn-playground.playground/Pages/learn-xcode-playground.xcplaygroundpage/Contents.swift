//: ## 介绍标记语法

/*:
 单行标记通过 `//:` 来实现
 多行标记 `/*
        内容1
        内容2
        */`
 */

/*: ## Intro
 这是我的 Swift 学习笔记
 我回记录下我学习 Swift 相关过程
 通过 **Editor -> show render markup** 来渲染 markdown 内容
 ### 目录
 > 通过 `[标题](playground page name)` 来实现page之前的跳转
 
 iOS 开发需要掌握的技术：
 1. Swift 语言基础
 2. 界面卡法
 3. 网络处理技术
 4. 数据处理和存储技术
 
 ### Part1 Swift 基础
 - [var 和 const](00-var-const)
 - [base type]()01-base_type
 - [string](02-string)
 - [复合类型](03-set_type)
 - [流程控制](04-flow-control)
 - [函数和闭包](05-func-closures)
 - [枚举](06-enum)
 - [高级运算符](07-adv-op)
 - [结构体和类](08-class-and-struct)
 - [内存管理](09-mem)
 - [类型转换和泛型](10-cast-type-and-generics)
 - [Swift新特性](11-swfit5-feature)
 
 ### Part2 UIKit

 ### Part3 SwiftUI
 ### 上一页和下一页
 - `//: [Previous](@previous)` 上一页
 - `//: [Next](@next)` 下一页
 
 语法：`[名称](页面)` 来进行页面跳转
 也可以进行定制化
 ```
 [< Previous](@previous)            [Home](learn-xcode-playground)          [Next>](@next)
 ```
 
 xcode 中可以在 `Editor->Create Code Snipet` 创建模板code，模板变量通过 `<#占位符#>` 来展示

 
 ### 添加资源（Resources）文件夹
 从 Finder 拖拽文件到 Resources 目录
 然后通过 markdown 语法进行引用 `![]()`
 ![图片](2.png width="200" height="200")
 
 ## Note
 - Example: 实例
 - Note: 警告
 - Important: 重要
 - Callout(自定义): 自定义
 - Experiment: s

 ```
 for a in nums {
    print(a)
 }
 ```

 ## Resources
- 源文件在项目的 `Resources` 目录下表示全局通用
 
引用函数
```swift
 //Resources/print_code.swift
 // 注意是 public
 public func code(for title: String, sampleCode:()->Void) {
     print("""
 -----------
 Result for '\(title)'
 """)
     sampleCode()
 }

 // 使用 code 函数
 code(for: "For1", sampleCode: {
     (1...10).forEach{
         if $0 % 2 == 0 {
             print($0)
         }
     }
 })
```
 
 ## 参考
 - [官方文档](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html#//apple_ref/doc/uid/TP40016497-CH2-SW1)
 */


// 使用 code 函数
code(for: "For1", sampleCode: {
    (1...10).forEach{
        if $0 % 2 == 0 {
            print($0)
        }
    }
})

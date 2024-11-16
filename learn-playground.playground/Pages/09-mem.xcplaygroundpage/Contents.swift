/*:
 [< Previous](@previous)            [内存管理](09-mem)          [Next>](@next)
 ## 内存管理——引用计数
 
 Swift 采用引用计数来管理实例的内存空间。
 
 ### 自动引用计数
 作用域：
 - 普通的变量和常量只在离自己最近的大括号内
 - 属性与具体的实例生命周期保持一致
 
 当一个变量脱离的其作用域，就会被销毁，所占用的内存空间也会被销毁
 
 1. 值类型传递采用完全复制，原数据的销毁不会影响到新数据
 2. 引用类型通过引用的方式对原数据进行访问，对应同一个地址空间
 
 
 若有人引用，引用计数器加+，解除对他引用就会减一，直到为 0 ，他就会被销毁。
 
 避免循环引用导致内存泄漏，需要避免连个实例相互引用。
 
 ### 解决循环引用
 1. weak，其修饰的引用类型在数据传递时不会引用加一，允许值为 nil，如果引用实例被销毁了，再次使用会被当成 Optional 值 nil 来处理，不会引起崩溃（兼容性更好）
 2.unowned，假定属性不为 nil，如果引用实例被销毁了，再次使用会崩溃（更安全）
 */

//COne 和 CTwo 彼此引用，造成循环引用
class COne {
    var name = ""
    // var cls :CTwo?
    // 解决循环引用
    weak var cls :CTwo?
    // 无主引用：假定属性不为 nil，如果引用实例被销毁了，再次使用会崩溃
    // unowned var cls :CTwo
    init(cls: CTwo) {
        self.cls = cls
    }
    // 闭包中的循环引用
    lazy var fn: ()-> Void = {
        // 使用捕获列表对闭包中使用的 self 进行无主引用的转换
        [unowned self] ()->Void in
        print(self.name)
    }
}
class CTwo {
    var cls:COne?
    init(cls: COne) {
        self.cls = cls
    }
}

/*：
 ## 错误和异常
 Swift 中所有的错误和异常都是通过 Error 协议来指定的
 
 异常抛出通过 throw 关键词
 异常的捕获
 1. 通过 do-catch 结构
 2. 异常值转为 Optional 类型
 3. 程序异常终止
 */
// 自定义异常类型，遵守 Error 协议
enum MyError:Error {
    case HttpError // http err
    case BizError // biz err
}

// 抛出异常，若程序不进行捕获，下面的代码不会执行
// do-catch
do {
    // 可能产生异常的代码
    try maybeErr()
} catch MyError.BizError{
    print("BizError")
} catch MyError.HttpError{
    print("HtttpError")
} catch{
    print("ass")
}

func maybeErr() throws -> Void{
    defer {// return 之前执行
        print("defer")
    }
    // 抛出异常
    throw MyError.BizError
}
// Optional
if let _ = try? maybeErr() {
    print("success")
} else{
    print("failed")
}



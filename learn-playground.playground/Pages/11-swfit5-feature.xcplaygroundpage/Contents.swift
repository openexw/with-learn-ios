/*:
 [< Previous](@previous)            [Swift5.3新特性](11-swift5-feature)          [Next>](@next)
 ## Swift5.3新特性
 ### 内存安全检查特性。
 两个变量同时访问同一块内存时，会产生独立内存访问限制。
 内存的访问有读访问和写访问两种：
 */
var name="Jack" // 写访问
print(name) // 读访问


/*:
 程序会产生读写权限冲突的条件：
 （1）至少有一个变量在使用写权限。
 （2）变量访问的是同一个内存地址。
 （3）持续时间有重叠
 
 #### inout 参数读写权限冲突
 */
// num 始终开启写权限，step 进行了读访问，产生了读写冲突
var step = 1
func incStep(_ num:inout Int) {
    num += step // crash swift::runtime::AccessSet::insert
}
func incStep2(_ num1:inout Int, _ num2:inout Int){
    var a = num1 + num2 // crash swift::runtime::AccessSet::insert
}
//incStep(&step)
//incStep2(&step, &step) // swift 6 直接编辑器报错
//print(step)
/*:
 #### 结构体中自修改函数的读写冲突
 struct 是一种值类型，会存在读写冲突场景
 */
struct Player{
    var name:String
    var health:Int
    // health 对 self 自身的读访问，而 inout 参数是写访问，会产生
    mutating func shareHealth(_ player:inout Player) {
        health = player.health
    }
}
var play = Player(name: "Jack", health: 10)
//play.shareHealth(&play) // swift 6 直接编辑器报错
/*
 #### 值类型中属性的读写访问冲突
 */
class Demo {
    var info = (health:10, energy:20)
    func balance(_ h:inout Int, _ e:inout Int){}
    func test(){
        self.balance(&info.health, &info.energy)
    }
}
let demo = Demo()
//demo.test() // swift 6 直接编辑器报错
/*:
 ### 关联类型的约束方式
 约定泛型的类型
 */
protocol Container {
    // 约束 Item 为 Int 类型
    associatedtype Item where Item == Int
    func append(_ item: Item)
    var count:Int{get}
    subscript(i:Int) -> Item{get}
}
class IntArr:Container {
    //  必须指定 Init 否则会报错
    typealias Item = Int
    var innerArr = [Int]()
    
    func append(_ item: Int) {
        self.innerArr.append(item)
    }
    
    var count: Int {
        get {
            return self.innerArr.count
        }
    }
    
    subscript(i: Int) -> Int {
        return self.innerArr[i]
    }
}
/*:
 ### 多行字符串的创建。
 */
var str = """
haca
jack
mack
"""

// 使用字符串界定符可以避免转义的烦恼
var str2 = "呵\"哈\"" // 使用界定符之前
str2 = #"呵"哈""# // 使用界定符之后
/*:
 ### 区间运算符的更多功能。
 */
var arr = ["1", "2", "r"]
for item in arr[0..<arr.count]{
    print(item)
}
for item in arr[0...]{ // swift 4 之后
    print(item)
}
/*:
 动态成员查找和动态方法调用
 访问不存咋的属性会报错，通过 @dynamicMemberLookup 关键词修饰后可以为数据结构增加动态成员查找能力
 1. 被 @dynamicMemberLookup 修饰的需要新增 subscript 方法返回对应类型的值
 2. 动态方法通过 #
 */

@dynamicMemberLookup
@dynamicCallable
class CustonData {
    var name = ""
    var age = 0
    subscript(dynamicMember member:String) -> String{
        return "unknow"
    }
    subscript(dynamicMember member:Int) -> Int{
        return 0
    }
    
    // 参数为 string数组时调用
    func dynamicallyCall(withArguments args:[String]) {
        print("unkonw func \(args)")
    }
    
    // 参数为 map 时调用
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String,Int>) {
        let rs = args.map {key, val in
            return "[\(key), \(val)]"
        }.joined(separator: "--")
        print(rs)
    }
}
var cd = CustonData()
let other:String = cd.other // 访问不存在的属性，会根据指定的属性类型调用对应的 subscript 方法对应类型的值
cd("字符串", "a", "b")
cd(a:10, b:199)
/*:
 ### 协议的混合方法。
 ### 特殊的Self类型
 */

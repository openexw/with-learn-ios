//====== Array
// 可以存放任意类型的数据，但是所有元素类型必须统一
// 声明数组
var a1:[Int]
var a2:Array<Int>

// 创建空数组
a1 = []
a2 = Array()
// 创建10个String类型的数组，每个元素都为 Hello
var a3 = [String](repeating: "Hello", count: 10)
//创建5个 Int 类型的数组，每个元素都为 1
var a4 = Array(repeating: 1, count: 5)

// 数组相加
var a5 = [Int](repeating: 2, count: 5)
var arr = a4+a5

// 方法
arr.count
arr.isEmpty
arr.first
arr.last
arr[0] = 13 // 修改第 0 个元素
arr[0...3] = [12, 14, 4] // 修改 0-3 的分别为 ...
arr.append(10) // 追加
arr.append(contentsOf: [1,23]) // 追加一组数据
arr.contains(1) // 是否包含
//arr.removeAll() // 删除

// 遍历
for item in arr {
    print(item)
}
// 数据枚举遍历
for item in arr.enumerated() {
    print(item)
}
// 数组角标遍历
for index in arr.indices {
    print("index: \(index), val: \(arr[index])")
}

// 排序
arr.sort(by: >) // 从大到小
arr.sort(by: <) // 从小到大
arr.max()
arr.min()

//====== Set
// 创建 set
var s1:Set<Int> = [1,3,4,6,7,8,1,1]
var s2 = Set(arrayLiteral: 1,3,4)


s1[s1.startIndex] // 首个元素
s1[s1.index(after: s1.startIndex)] // 获取后一个元素
s1[s1.index(s1.startIndex, offsetBy: 2)] // 获取后几个元素

s1.count
s1.isEmpty
s1.contains(2)
s1.max()
s1.min()

s1.insert(33)
s1.remove(1)
s1.removeFirst() // 移除第一个元素
//s1.remove(at: s1.firstIndex(of: 1)!) // 移除某一个位置的元素
//s1.removeAll()

// 集合的运算
s1.intersection(s2) // 交集
s1.symmetricDifference(s2) // 交集的补集
s1.union(s2) // 并集
s1.subtracting(s2) // 补集

// 集合间的关系
s1.isSubset(of: s2) // s1 是否是 s2 的子集
s2.isSuperset(of: s1) // s2 是否是 s1 的超集
s1.isStrictSubset(of: s2) // s1 是否是 s2 的真子集

// 比较
s1 == s2 // 两个集合所有的元素都相对时两个集合相等

// 遍历
for item in s1 {
    print(item)
}
for item in s1.enumerated() {
    print(item)
}
for item in s1.indices {
    print(item)
}
for item in s1.sorted(by: >) { // 从大到小
    print(item)
}
//====== Dictionary
var d1:[Int:String]
var d2:Dictionary<Int,String>

d1 = [1:"1", 2:"2",3:"3"]
d2 = Dictionary(dictionaryLiteral:  (1,"1"), (2,"2"))

var d3 = ["1":"one"]

// 空字典
var d4:[Int:Int] = [:]
var d5:Dictionary<Int, Int> = Dictionary()

d2.isEmpty
d2.count

d1[1] // 获取值
d1[2] = "ss" // 修改值
d1.updateValue("22", forKey: 3) // key 不存在则新增，返回 Value?，key 不存在则返回 nil

// 删除
d1.removeValue(forKey: 1)

// 遍历
for item in d1.keys { // 按字典遍历
    print(item)
}
for item in d1.values { // 按值遍历
    print(item)
}
for item in d1{ // 返回元组
    print(item)
}
for (k,v) in d1 { // 按值遍历
    print("k: \(k), val: \(v)")
}
for item in d1.keys.sorted(by: >){ // 返回元组
    print(item)
}



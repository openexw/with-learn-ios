// 创建一个数组、集合或字典并且把它分配成一个变量，这个集合将会是可变的
// 申明数组
var arrInts: [Int] = []
// 带默认值的数组
//var arrInts = Array(repeating: 0, count: 3)

var aInts = Array(repeating: 0, count: 3)
//print("aInts: \(aInts)")
//print("aaa")

//aInts.isEmpty
//aInts.append(1)
aInts.insert(12, at: 0)
aInts.remove(at: 0)
// @main
//print("Hello, world!")

// 集合
var letters = Set<String>() // 声明集合 letters
letters.insert("hehe") // 插入数据

var letters1: Set = ["A", "B", "C"]
// attr && method
letters1.count
letters1.isEmpty
letters1.insert("aa") // 插入数据
letters1.remove("A") // 删除数据
letters1.contains("B") // 判断是否包含
letters1.sorted() // 排序
// 集合的交并差
letters.symmetricDifference(letters1)
letters.intersection(letters1)
letters.union(letters1)
letters.subtracting(letters1)







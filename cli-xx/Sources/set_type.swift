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
var letters = Set<String>()
letters.insert("hehe")
var letters1: Set = ["A", "B", "C"]
letters1.count
letters1.isEmpty
letters1.insert("aa")
letters1.remove("A")
letters1.contains("B")
letters1.sorted()
// 集合的交并差
letters.symmetricDifference(letters1)
letters.intersection(letters1)
letters.union(letters1)
letters.subtracting(letters1)






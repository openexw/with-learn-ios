import Foundation

// 交通工具
public class Trans {
    var perol:Int = 10 // 油量
    func drive()  {
        if perol == 0 {
            self.addPerol()
        }
    }
    
    func addPerol() {
        perol += 10
    }
}

// 小汽车：继承
//public class Car: Trans {
//    var type: Int // 类型
//    override func drive()  {
//       super.drive() // 调用父类的方法
//        print("在路上行驶了 10 km")
//        self.perol -= 1
//    }
//    init(type: Int) {
//        self.type = type
//    }
//}



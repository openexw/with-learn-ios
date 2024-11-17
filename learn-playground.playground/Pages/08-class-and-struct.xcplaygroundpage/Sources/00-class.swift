public class Car {
    var pertol:Int // 油量
    // 方法
    func drive(){
        if pertol > 0 {
            pertol -= 1
        }
    }

}

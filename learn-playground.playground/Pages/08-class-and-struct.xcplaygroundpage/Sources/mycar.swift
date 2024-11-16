
public class MyCar {
    var color:String
    var price:Double
    
    func info (){
        print("this car price is \(price) color is \(color)")
    }
    init(color: String, price: Double) {
        self.color = color
        self.price = price
    }
}

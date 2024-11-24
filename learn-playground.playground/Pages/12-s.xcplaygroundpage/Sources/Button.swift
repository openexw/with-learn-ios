import UIKit

public class ButtonViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: CGRect(x: 0, y: 100, width: 200, height: 50 ))
        btn.setTitle("点我", for: .normal)
        btn.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.red
        self.view.addSubview(btn)
    }
}

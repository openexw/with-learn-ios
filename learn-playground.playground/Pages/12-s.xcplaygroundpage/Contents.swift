/*:
基础组件：
 - UILabel
 - UIButton
 - UIImageView
 - UITextField
 - UISwitch
 - UIPageControl
 - UISegmentedControl
 */
import UIKit
import AVFoundation

class LabelViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        label.text = "点我"
        self.view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 30))
        label1.text = "自定义Lable"
        label1.numberOfLines = 7 // 显示行数：
        label1.font = UIFont.boldSystemFont(ofSize: 20)
        label1.textColor = UIColor.red // 颜色
        // 阴影
        label1.shadowColor = UIColor.green
        label1.shadowOffset = CGSize(width: 2, height: 2)
        // 文本对齐方式
        label1.textAlignment = NSTextAlignment.center
        self.view.addSubview(label1)
    }
    
    
}

var vc = LabelViewController()


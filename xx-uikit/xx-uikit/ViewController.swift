//
//  ViewController.swift
//  xx-uikit
//
//  Created by 薄荷 on 2024/11/17.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        label.text = "点我"
        self.view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 30))
        label1.text = "自定义Lable"
        label1.numberOfLines = 7 // 显示行数：若设置为 0 则不限制行数，超过宽高后，会被截断
        label1.font = UIFont.boldSystemFont(ofSize: 20)
        label1.textColor = UIColor.red // 颜色
        // 阴影
        label1.shadowColor = UIColor.green
        label1.shadowOffset = CGSize(width: 2, height: 2)
        // 文本对齐方式
        label1.textAlignment = NSTextAlignment.center
        self.view.addSubview(label1)
        
        // 个性化设置
        let label2 = UILabel(frame: CGRect(x: 20, y: 390, width: 200, height: 30))
        label2.numberOfLines = 7
        let attr = NSMutableAttributedString(string: "个性化文本个")
        // 0-2为红色
        attr.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 2))
        // 3，取3个为蓝色
        attr.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSRange(location: 3, length: 3))
        label2.attributedText = attr
        self.view.addSubview(label2)
    }
    
    
}


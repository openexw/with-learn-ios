//
//  ViewController.swift
//  x-uikit
//
//  Created by 7yue on 2024/11/17.
//

import UIKit

class ViewController: UIViewController,DetailPtotcool {
    var lable : UILabel?
    func sendData(data: String) {
        self.lable?.text = data // 返回子页面的内容
    }
    @IBAction func touch(_ sender: Any) {
        let detail = DetialController(data: "父页面往下带数据")
        //        detail.delegate = self // 遵守协议方式。设置代理
        //  闭包方式
        detail.cb = {(data:String) in
            self.lable?.text = data
        }
        self.present(detail, animated: true, completion: nil)
        // 正向传递：A -> B
        // 反向传递；B -> A。协议或者闭包
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lable = UILabel(frame: CGRect(x: 20, y: 50, width: 200, height: 30))
        self.view.addSubview(lable!)
    }
    
}


//
//  Label.swift
//  
//
//  Created by 薄荷 on 2024/11/17.
//
import UIKit
import PlaygroundSupport


public class LabelViewController: UIViewController {
    public override func loadView() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        label.text = "点我"
        self.view.addSubview(label)
    }
}

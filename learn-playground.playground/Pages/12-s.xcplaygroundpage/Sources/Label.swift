//
//  Label.swift
//
//
//  Created by 薄荷 on 2024/11/17.
//
import UIKit


public class LabelViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        label.text = "点我"
        label.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.red
        self.view.addSubview(label)
    }
}

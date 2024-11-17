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
        
        /*
         常用的 key
         font：字体，UIFont
         paragraphStyle：段落风格，NSParagraphStyle
         backgroundColor: 北京颜色
         foregroundColor：文本颜色
         underlineStyle：下划线颜色
         shadow：阴影
         link：跳转链接
         underlineColor：下划线颜色
         */
        
        // ========= UIButton
        let bt1 = UIButton(type: UIButton.ButtonType.custom)
        bt1.frame = CGRect(x: 20, y: 410, width: 100, height: 30)
        bt1.backgroundColor = UIColor.purple
        bt1.setTitle("喝水记录", for: .normal)
        bt1.setTitleColor(UIColor.white, for: .normal)
        bt1.addTarget(self, action: #selector(touchbegin), for: UIControl.Event.touchUpInside)
        // 添加自定义图片
        // 1. 图片作为按钮内容，2-图片作为按钮的背景
        let waterIcon = UIImage(named: "icon-water")
        // waterIcon?. = CGSize(width: 50, height: 50)
        bt1.setImage(waterIcon, for: .normal)
        bt1.layer.borderWidth = 2
        bt1.layer.borderColor = UIColor.red.cgColor
        bt1.configuration = UIButton.Configuration.plain()
        bt1.configuration?.imagePlacement = .trailing
        bt1.configuration?.imagePadding = 10
        self.view.addSubview(bt1)
        
        
        // ===== UIImageView
        let waterIcon1 = UIImage(named: "icon-water")
        let iv = UIImageView(image: waterIcon1)
        iv.frame = CGRect(x: 20, y: 450, width: 210, height: 210)
        self.view.addSubview(iv)
        
        // ===== UITextField
        let uame = UITextField(frame: CGRect(x: 20, y: 670, width: 400, height: 30))
        uame.borderStyle = UITextField.BorderStyle.roundedRect
        uame.textColor = UIColor.red
        uame.textAlignment = NSTextAlignment.left
        uame.placeholder  = "请输入"
        let textLeftIV = UIImageView(image: waterIcon1)
        textLeftIV.layer.borderWidth = 1
        //        textLeftIV.layer.borderColor = UIColor.red
        textLeftIV.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let textRIV = UIImageView(image: waterIcon1)
        textRIV.layer.borderWidth = 1
        textRIV.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        uame.leftView = textLeftIV
        uame.rightView = textRIV
        uame.leftViewMode = UITextField.ViewMode.always
        uame.rightViewMode = UITextField.ViewMode.always
        self.view.addSubview(uame)
        
        // ==== UISwitch
        let swi = UISwitch()
        swi.center = CGPoint(x: 100, y: 100)
        swi.onTintColor = UIColor.green
        swi.thumbTintColor = UIColor.purple
        swi.isOn = true
        swi.addTarget(self, action: #selector(toggleSwi), for: UIControl.Event.valueChanged)
        self.view.addSubview(swi)
        
        // ====UIPageControl
        let pageCtl = UIPageControl(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        pageCtl.numberOfPages = 10 // 设置页数
        pageCtl.backgroundColor = UIColor.red // 背景颜色
        pageCtl.pageIndicatorTintColor = UIColor.green // 页码点背景颜色
        pageCtl.currentPage = 3 // 当前页数
        pageCtl.addTarget(self, action: #selector(pageChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(pageCtl)
        
        // === UISegmentedControl,分页tab
        let sc = UISegmentedControl(items: ["bt1", "bt2"])
        // 插入
        sc.insertSegment(withTitle: "bt3", at:0, animated: true)
        sc.insertSegment(with: waterIcon1?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), at: 4, animated: true)
        // 删除
        // sc.removeSegment(at: <#T##Int#>, animated: <#T##Bool#>)
        // sc.removeAllSegments()
        //  修改
        // sc.setImage(<#T##image: UIImage?##UIImage?#>, forSegmentAt: <#T##Int#>)
        // sc.setTitle(<#T##title: String?##String?#>, forSegmentAt: <#T##Int#>)
        // 自定义单个 btn 的宽高
        sc.setWidth(8, forSegmentAt: 0)
        sc.apportionsSegmentWidthsByContent = true // 自适应宽度
        sc.frame = CGRect(x: 100, y: 150, width: 200, height: 30)
        sc.tintColor = UIColor.blue
        sc.addTarget(self, action: #selector(scChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(sc)
    }
    @objc func scChange(sc:UISegmentedControl) {
        print("select: \(sc.selectedSegmentIndex)")
    }
    @objc func pageChange(pageCtl:UIPageControl){
        print("currpage: \(pageCtl.currentPage)")
    }
    @objc func toggleSwi(swi:UISwitch){
        print("swith: \(swi.isOn)")
    }
    @objc func touchbegin(){
        print("点击了我")
    }
}


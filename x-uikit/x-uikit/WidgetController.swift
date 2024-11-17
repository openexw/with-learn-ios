//
//  WidgetController.swift
//  x-uikit
//
//  Created by 7yue on 2024/11/17.
//

import UIKit

class WidgetController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        // === 滑动 Slide
        let sd = UISlider(frame: CGRect(x: 100, y:200, width: 200, height: 30))
        sd.maximumValue = 100 // 滑块最大值
        sd.minimumValue = 0 // 滑块最小值
        sd.value = 2 // 滑块当前值
        sd.minimumTrackTintColor = UIColor.red // 滑块左侧进度条颜色
        sd.maximumTrackTintColor = UIColor.blue // 滑块右侧进度条颜色
        sd.thumbTintColor = UIColor.green // 滑块颜色
        sd.setThumbImage(waterIcon, for: .normal) // 设置滑块的图片
        sd.setMinimumTrackImage(UIImage(named: "icon-step"), for: .normal) // 设置滑块左端的图片
        sd.setMaximumTrackImage(UIImage(named: "icon-poo"), for: .normal) // 设置滑块右端的图片
        sd.isContinuous = false // 拖拽结束后再发生交互事件（松开才调用）
        sd.addTarget(self, action: #selector(sdCHange), for: UIControl.Event.valueChanged)
        self.view.addSubview(sd)
        // === 活动指示器控件UIActivityIndicatorView  => loading
        //        self.view.backgroundColor = UIColor.red
        //        let aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        //        aiv.center = self.view.center
        //        aiv.startAnimating() // 开始播放
        ////        aiv.stopAnimating() // 停止播放
        //        self.view.addSubview(aiv)
        // === 进度条控件UIProgressView
        let pv = UIProgressView(frame: CGRect(x: 100, y: 250, width: 280, height: 10))
        pv.progress = 0.5 // 取值 0-1
        pv.progressTintColor = UIColor.green
        pv.trackTintColor = UIColor.gray
        //        pv.progressImage 已走过的图片
        //        pv.trackImage // 轨迹的图片
        self.view.addSubview(pv)
        // === 步进器控件UIStepper的应用，取值是离散的，调节非连续性的值
        let stepView = UIStepper(frame: CGRect(x: 100, y: 270, width: 0, height: 0))
        stepView.tintColor = UIColor.green // 控件颜色
        stepView.minimumValue = 0
        stepView.maximumValue = 100
        stepView.stepValue = 5 // 步长
        stepView.isContinuous = false // 改变值时是否触发交互行为
        stepView.wraps=true // 是否循环，到达极限值后是否从头开始
        stepView.autorepeat=true // 是否叠加，按住不放时是否改变
        // stepView.setBackgroundImage() // 设置背景图片
        // stepView.setDividerImage() // 设置分割线图片
        // stepView.setIncrementImage() // 设置增加按钮图片
        // stepView.setDecrementImage() // 设置减少按钮图片
        stepView.addTarget(self, action: #selector(stepCHange), for: UIControl.Event.valueChanged)
        self.view.addSubview(stepView)
        // === 选择器控件UIPickerView的应用。
        // === 时间选择器控件UIDatePicker的应用
        let datePick = UIDatePicker(frame: CGRect(x: 100, y: 300, width: 280, height: 200))
        datePick.datePickerMode =   UIDatePicker.Mode.countDownTimer
        datePick.addTarget(self, action: #selector(datePickChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(datePick)
        // === 搜索栏控件UISearchBar的应用
        let searchBar = UISearchBar(frame: CGRect(x: 100, y: 500, width: 280, height: 80))
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.barTintColor = UIColor.red // 控件的颜色
        //        searchBar.backgroundImage // 背景图
        searchBar.placeholder = "请输入"
        searchBar.prompt = "搜索提示"
        //        searchBar.setImage(, for: , state: )
        searchBar.showsScopeBar = true // 附件组件
        searchBar.scopeButtonTitles = ["最近搜索", "热门搜索"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.frame = CGRect(x: 100, y: 500, width: 280, height: 150)
        //  UISearchBarDelegate 协议
        self.view.addSubview(searchBar)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func datePickChange(pick:UIDatePicker){
        print("date pick: \(pick.date)")
    }
    @objc func stepCHange(step:UIStepper){
        print("step: \(step.value)")
    }
    @objc func sdCHange(sd:UISlider){
        print("slider: \(sd.value)")
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

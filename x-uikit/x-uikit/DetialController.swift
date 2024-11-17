//
//  DetialController.swift
//  x-uikit
//
//  Created by 7yue on 2024/11/17.
//

import UIKit

protocol DetailPtotcool {
    func sendData(data:String)
}
class DetialController: UIViewController {
    var data:String?
    var delegate:DetailPtotcool?
    var cb: ((String)->Void)?
    init(data: String?) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        btn.setTitle("返回", for: .normal)
        btn.addTarget(self, action: #selector(recHome), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
        let lab = UILabel(frame: CGRect(x: 100, y: 250, width: 280, height: 30))
        lab.text = data
        self.view.addSubview(lab)
    }
    
    @objc func recHome(){
//        self.delegate?.sendData(data: "子页面回传数据")
        self.cb!("子页面回传数据")
        self.dismiss(animated:true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

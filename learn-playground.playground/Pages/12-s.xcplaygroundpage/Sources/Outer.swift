//
//  outer.swift
//
//
//  Created by 薄荷 on 2024/11/17.
//

import UIKit
import PlaygroundSupport

public func statr(){
    let btnView = ButtonViewController()
    let navVC = UINavigationController(rootViewController: btnView)
    PlaygroundPage.current.liveView = navVC
}

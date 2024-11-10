//
//  PageControl.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/11.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currPage
    }
    
    
    class Coordinator: NSObject {
        var control: PageControl
        
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currPage = sender.currentPage
        }
    }
}

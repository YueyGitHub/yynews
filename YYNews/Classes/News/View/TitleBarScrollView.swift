//
//  TitleBarScrollView.swift
//  YYNews
//
//  Created by Moon on 17/3/1.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

protocol TitleBarDelegate {
    func selectedTitleIndex(view: TitleBarScrollView, index: Int)
}

class TitleBarScrollView: UIView, UIScrollViewDelegate {

    var delegate: TitleBarDelegate?
    
    var titleArray: Array<String> = [] {
        didSet {
            titleArray.insert("头条", at: 0)
            setupButtons()
        }
    }
    var buttonsArr: [UIButton] = [UIButton]()   // 装按钮的数组
    var selectedButton: UIButton = UIButton()   // 当前选中的按钮
    var selectedIndex: Int = 0 {
        didSet {
            selectedButton.isSelected = false
            selectedButton = buttonsArr[selectedIndex]
            selectedButton.isSelected = true
        }
    }

    
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.backgroundColor = UIColor.cyan
        scrollView.alwaysBounceVertical = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false;
        return scrollView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.frame = self.bounds
        self.setupButtons()
        self.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtons() {
        if titleArray.count <= 0 {
            return
        }
        var maxX: CGFloat = 0
        let margeX: CGFloat = 20
        let padding: CGFloat = 15
        maxX = padding
        
        for index in 0...titleArray.count - 1 {
            let button: UIButton = UIButton()
            button.tag = index
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.setTitleColor(UIColor.red, for: .selected)
            button.setTitle(titleArray[index], for: .normal)
            button.addTarget(self, action: #selector(selectedAction), for: .touchUpInside)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.sizeToFit()
            button.frame = CGRect(x: maxX, y: 0, width: button.frame.size.width, height: self.frame.size.height)
            if index == 0 {
                button.isSelected = true
                selectedButton = button
            }
//            button.backgroundColor = UIColor.yellow
            maxX = maxX + button.frame.size.width + margeX
            
            buttonsArr.append(button)
            scrollView.addSubview(button)
        }
        maxX = maxX + padding - margeX
        scrollView.contentSize = CGSize(width: maxX, height: 0)
    }
    
    @objc private func selectedAction(button: UIButton) {
        print(button.tag)
        if button == selectedButton {
            return
        }
        
        selectedButton.isSelected = false
        selectedButton = button
        button.isSelected = true
        
        delegate?.selectedTitleIndex(view: self, index: button.tag)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

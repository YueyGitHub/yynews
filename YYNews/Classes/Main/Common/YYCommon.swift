//
//  YYCommon.swift
//  YYNews
//
//  Created by Moon on 17/3/1.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let kStatusBarHeight: CGFloat = 20
let kNavigationBarHeight: CGFloat = 64

let kTitleBarHeight: CGFloat = 40
let kMainContentHeight: CGFloat = kScreenHeight - kStatusBarHeight - kNavigationBarHeight - kTitleBarHeight

let ColorArc4random = UIColor.init(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat( arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat( arc4random_uniform(255))/CGFloat(255.0), alpha: 1)


class YYCommon: NSObject {

}

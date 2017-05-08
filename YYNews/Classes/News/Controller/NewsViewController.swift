//
//  NewsViewController.swift
//  YYNews
//
//  Created by Moon on 17/2/27.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, TitleBarDelegate, UIScrollViewDelegate {
    static let MyCollectionViewCell = "UICollectionViewCell"
    var subViewController: [UIViewController] = []
    var titleArray: Array<String> = ["娱乐","游戏","独家","轻松一刻"]
    
    var currentIndex = 0
    
    
    let titleBarView: TitleBarScrollView = {
         let titleBarView = TitleBarScrollView(frame: CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kTitleBarHeight))
        return titleBarView
    }()
    
    lazy var mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView(frame: CGRect(x: 0, y: kNavigationBarHeight + kTitleBarHeight, width: kScreenWidth, height: kMainContentHeight))
        mainScrollView.isPagingEnabled = true
//        mainScrollView.alwaysBounceHorizontal = false
        mainScrollView.bounces = false
        mainScrollView.isScrollEnabled = true
        mainScrollView.delegate = self
        mainScrollView.backgroundColor = .red
        return mainScrollView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        addFirstSubView()
        
    }
    
    func addFirstSubView() {
        setupUI()
        let vc: UIViewController = subViewController[0]
        vc.view.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kMainContentHeight)
        mainScrollView.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.view.backgroundColor = UIColor.brown
        
    }
    
    func setupUI() {
        view.addSubview(titleBarView)
        view.addSubview(mainScrollView)
        titleBarView.titleArray = titleArray
        titleBarView.delegate = self
        
        
        var vcArray: [UIViewController] = []
        
        let topNewsVC: TopNewsViewController = TopNewsViewController()
        topNewsVC.title = "头条"
        vcArray.append(topNewsVC)
        
        for index in 0...titleArray.count - 1 {
        
            let vc: OtherNewsViewController = OtherNewsViewController()
            vc.view.backgroundColor = UIColor.init(red: CGFloat(arc4random_uniform(255))/CGFloat(255.0), green: CGFloat( arc4random_uniform(255))/CGFloat(255.0), blue: CGFloat( arc4random_uniform(255))/CGFloat(255.0), alpha: 1)
            vc.title = titleArray[index]
            vcArray.append(vc)
        }
        
        subViewController = vcArray
        
        mainScrollView.contentSize = CGSize(width: kScreenWidth * CGFloat(subViewController.count), height: 0)
    }
    
    
    
    // MARK: - 代理TitleBarDelegate
    func selectedTitleIndex(view: TitleBarScrollView, index: Int) {
        mainScrollView.setContentOffset(CGPoint(x: CGFloat(index) * kScreenWidth, y: 0), animated: false)
    }
    
    // MARK: - 代理UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / kScreenWidth)
        titleBarView.selectedIndex = currentIndex

        let vc: UIViewController = subViewController[currentIndex]
        vc.view.frame = CGRect(x: CGFloat(currentIndex) * kScreenWidth, y: 0, width: kScreenWidth, height: kMainContentHeight)
        mainScrollView.addSubview(vc.view)
        self.addChildViewController(vc)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

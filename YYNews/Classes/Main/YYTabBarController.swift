//
//  YYTabBarController.swift
//  YYNews
//
//  Created by Moon on 17/2/27.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

class YYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupChildVC()
        
        self.tabBar.tintColor = UIColor.red
        
    }
    
    func setupChildVC() {
        let vc1: NewsViewController = NewsViewController()
        self.setupChildrenController(vc: vc1, image: "tabbar_icon_news_normal", selectedImage: "tabbar_icon_news_highlight", title: "新闻")
        
        let vc2: LiveViewController = LiveViewController()
        self.setupChildrenController(vc: vc2, image: "tabbar_icon_media_normal", selectedImage: "tabbar_icon_media_highlight", title: "直播")

        let vc3: TopicViewController = TopicViewController()
        self.setupChildrenController(vc: vc3, image: "tabbar_icon_bar_normal", selectedImage: "tabbar_icon_bar_highlight", title: "话题")

        let vc4: MineViewController = MineViewController()
        self.setupChildrenController(vc: vc4, image: "tabbar_icon_me_normal", selectedImage: "tabbar_icon_me_highlight", title: "我")
    }
    
    func setupChildrenController(vc: UIViewController, image: String, selectedImage: String, title: String) {
        vc.view.backgroundColor = UIColor.white
        let navi: UINavigationController = UINavigationController.init(rootViewController: vc)
        var selectedImg: UIImage = UIImage.init(named: selectedImage)!
        selectedImg = selectedImg.withRenderingMode(.alwaysOriginal)
        vc.navigationItem.title = title
        let vcItem: UITabBarItem = UITabBarItem(title: title, image: UIImage(named: image), selectedImage: selectedImg)
        vc.tabBarItem = vcItem;
        self.addChildViewController(navi)
        
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

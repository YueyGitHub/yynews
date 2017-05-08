//
//  TopNewsViewController.swift
//  YYNews
//
//  Created by Moon on 17/3/2.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit
import Kingfisher

let IdentifierCell = "IdentifierCell"
let CycleViewHeight: CGFloat = 200


class TopNewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kMainContentHeight), style: .plain)
        tableView.register(TopNewsCell.classForCoder(), forCellReuseIdentifier: IdentifierCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        return tableView
    }()
    
    var dataArray = Array<NewsModel>()
    
    lazy var cycleView: YYCycleScrollView = {
        let cycleView: YYCycleScrollView = YYCycleScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CycleViewHeight))
        
        return cycleView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: CycleViewHeight))
        tableView.tableHeaderView?.addSubview(cycleView)
        cycleView.images = ["h1.jpg","h2.jpg","h6.jpg","h7.jpg"]
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TopNewsCell = tableView.dequeueReusableCell(withIdentifier: IdentifierCell)! as! TopNewsCell
        let newsModel: NewsModel = dataArray[indexPath.row]
        let url = URL(string: newsModel.img!)
        cell.imgView.kf.setImage(with: url)
        cell.titleLabel.text = newsModel.title
        return cell
    }
    
    // MARK: - 网络获取数据
    func loadData() {
//        let url: String = "http://c.m.163.com/recommend/getSubDocPic?from=toutiao&prog=LMA1&open=&openpath=&passport=&devId=gA2dkjZZG2rOTaj9dqdyeSSHeugxzlGhI0aiCaPtOUXFON6u69qugMCY1KBOeSE3&version=20.1&spever=false&net=wifi&lat=&lon=&ts=1488171811&sign=g4WINngPjckEM33aThJIi1tOshCIFX6jEpjJmt%2BmM6F48ErR02zJ6/KXOnxX046I&encryption=1&canal=appstore&offset=0&size=10&fn=1"
        let url: String = "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"
        
        YYHttpManager().mainData(url: url, completion: { (data) in
            if data != nil {
                self.dataArray = data!
                self.tableView.reloadData()
            }
        }) { (error) in
            
        }
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

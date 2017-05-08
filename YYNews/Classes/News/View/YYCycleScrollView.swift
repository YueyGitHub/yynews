//
//  YYCycleScrollView.swift
//  YYNews
//
//  Created by Moon on 17/3/9.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

let cycleCell = "cycleCell"


class YYCycleScrollView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var mainView: UICollectionView = {
    
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.frame.size.width, height: 200)
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal    // 水平滚动
        let mainView: UICollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        mainView.delegate = self
        mainView.dataSource = self
        mainView.scrollsToTop =  false // 安装状态栏时滚动到最开始的位置
        mainView.isPagingEnabled = true
        mainView.showsHorizontalScrollIndicator = false
        mainView.register(YYCycleCell.classForCoder(), forCellWithReuseIdentifier: cycleCell)
        return mainView
    }()
    
    var images: Array = Array<String>(){
        didSet{
            for _ in 0...100 {
                for obj in images {
                    dataArr.append(obj)
                }
            }
            
            mainView.scrollToItem(at: IndexPath.init(item: 50 * count, section: 0), at: .init(rawValue: 0), animated: false)
        }
    }
    
    var dataArr: Array = Array<String>()
    
    
    var timer: Timer?
    var count: Int = 0
    var index: Int = 0
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        addSubview(mainView)
        
//        addTimer()
        
    }
    
    // MARK: 添加定时器
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(aotoScroll), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .commonModes)
    }
    
    // MARK: 销毁定时器
    func removeTimer() {
        timer?.invalidate()
    }
    
    // MARK: 利用定时器自动滚动
    func aotoScroll() {
        index += 1
        if count == 0 {return}
        print(index%count)
        mainView.scrollToItem(at: IndexPath.init(item: index%count, section: 0), at: .init(rawValue: 0), animated: true)
    }
    
    func currentIndex() -> Int {
        let currentIndex = mainView.contentOffset.x / kScreenWidth
        
        return Int(currentIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: YYCycleCell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCell, for: indexPath) as! YYCycleCell
        let nameString = dataArr[indexPath.item]
        cell.imgView.image = UIImage(named: nameString)
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        self.addTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        resetContentOffset()
        
    }
    
    func resetContentOffset() {
        let offset = Int(mainView.contentOffset.x / self.frame.size.width) % count
        print("offset == \(offset)")
        mainView.scrollToItem(at: IndexPath.init(item: 50 * count + offset, section: 0), at: .init(rawValue: 0), animated: false)
    }

    override func draw(_ rect: CGRect) {
        // Drawing code
        count = images.count
    }


}

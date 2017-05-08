//
//  YYCycleCell.swift
//  YYNews
//
//  Created by Moon on 17/3/9.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

class YYCycleCell: UICollectionViewCell {
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 200))
        
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

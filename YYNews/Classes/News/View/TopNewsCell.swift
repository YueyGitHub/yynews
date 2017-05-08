//
//  TopNewsCell.swift
//  YYNews
//
//  Created by Moon on 17/3/8.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit

class TopNewsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 80))
        
        return imgView
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 100 + 20, y: 0, width: kScreenWidth - 100 - 20 - 10, height: 100))
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        
        addSubview(imgView)
        addSubview(titleLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

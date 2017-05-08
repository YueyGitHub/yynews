//
//  NewsModel.swift
//  YYNews
//
//  Created by Moon on 17/2/28.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit
import ObjectMapper

class NewsModel: Mappable{
    
    var id: Int = 0
    var img: String?
    var imgType: Int = 0
    var imgsrc: String?
    var recReason: String?
    var recSource: String?  // 新闻热点
    var title: String?
    var replyCount: Int = 0 // 跟帖数
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id          <-  map["id"]
        img         <-  map["img"]
        imgType     <-  map["imgType"]
        imgsrc      <-  map["imgsrc"]
        recReason   <-  map["recReason"]
        recSource   <-  map["recSource"]
        title       <-  map["title"]
        replyCount  <-  map["replyCount"]
    }
}

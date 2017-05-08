//
//  YYHttpManager.swift
//  YYNews
//
//  Created by Moon on 17/2/28.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit
//import SwiftyJSON
import ObjectMapper

//typealias successedClosure = (AnyObject?)->Void
//typealias failedClosure = (NSError?)->Void


class YYHttpManager: NSObject {

    //MARK: 首页新闻信息
    func mainData(url: String, completion: @escaping (_ responseObject: Array<NewsModel>?) -> Void, failure: @escaping (_ error: Error?) -> ()) {
        
        YYHttpSessionsRequest().httpJSONDataWithUrl(url: url, successed: { (data) in
            
            var modelArray = [NewsModel]()
            if let array = data?["tid"] as? Array<[String: AnyObject]>{
                for obj in array {
                    let model = Mapper<NewsModel>().map(JSON: obj)
                    modelArray.append(model!)
                }
            }
            completion(modelArray)
            
        }) { (error) in
            
        }
    }
}




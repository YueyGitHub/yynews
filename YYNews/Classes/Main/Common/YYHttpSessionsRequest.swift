//
//  YYHttpSessionsRequest.swift
//  YYNews
//
//  Created by Moon on 17/2/28.
//  Copyright © 2017年 mac mini. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class YYHttpSessionsRequest: NSObject {
    let headers: HTTPHeaders = [
//        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//        "Accept": "application/json"
    :]
    // --GET请求获取JSON数据
    func getJSONDataWithUrl(url: String, parameters: [String: AnyObject], successed:@escaping (_ responseObject: AnyObject?) -> (), failed: @escaping (_ error: NSError?) -> ()) {
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if response.result.isSuccess {
                successed(response.data as AnyObject?)
            }else {
                failed(response.result.error as NSError?)
            }
        }
    }
    
    
    // --POST请求获取JSON数据
    func postJSONDataWithUrl(url: String, parameters: [String: AnyObject], successed:@escaping (_ responseObject: AnyObject?) -> (), failed: @escaping (_ error: NSError?) -> ()) {
        //print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            if response.result.isSuccess {
                successed(response.data as AnyObject?)
            }else {
                failed(response.result.error as NSError?)
            }
        }
        
    }
    
    func httpJSONDataWithUrl(url: String, successed: @escaping (_ responseObject: [String: AnyObject]?) -> (), failed: @escaping (_ error: Error?) -> ()) {
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("firstMethod --> responseData() --> utf8Text = \(utf8Text)")
                }
                successed(response.result.value as! [String : AnyObject]?)
                
            }else {
                failed(response.result.error)
            }
        }
    }
    
}

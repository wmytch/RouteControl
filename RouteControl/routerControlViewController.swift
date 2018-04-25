//
//  routerControlViewController.swift
//  RouteControl
//
//  Created by Mac on 2018/4/11.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit

class RouterControlViewController: UIViewController{
    let defaultMacList = UserDefaults.standard
    let routerData=RouterData()
   
    @IBOutlet var macFilterNotice: UILabel!
    
    @IBAction func macFilterSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            self.macFilterNotice.text="MAC过滤已启用"
            ruleSwitch(by:"allow")
        }
        else {
            self.macFilterNotice.text="MAC过滤已禁用"
            ruleSwitch(by:"disabled")
        }
    }
    
    func ruleSwitch(by filter_mode:String){
        let url=URL(string:"http://192.168.211.1/goform/WlanMacFilter")
        var request=URLRequest(url:url!,cachePolicy:NSURLRequest.CachePolicy.useProtocolCachePolicy,timeoutInterval:10)
        
        request.httpMethod="POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("admin:language=cn", forHTTPHeaderField: "Cookie")

        var postString = "GO=http://192.168.211.1/wireless_filter.asp"
        postString+="&maclist="
        for macItem in routerData.macList{
            postString=postString+macItem.uppercased()+"+"
        }
        postString=String(postString.dropLast())
        postString+="&ssidIndex=0"
        postString=postString+"&FilterMode="+filter_mode
//        print(postString)
        
        request.httpBody = postString.data(using: .ascii)
        URLSession(configuration: .default).dataTask(with: request, completionHandler:{ (data:Data?,response:URLResponse?,error:Error?) in
                guard let _ = data, error == nil else {                                                 // check for fundamental networking error
                    self.macFilterNotice.text=String(describing: error)
                    return
                }
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    self.macFilterNotice.text=String(httpStatus.statusCode)
                }
            }
        ).resume()
        
    }

    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDeviceWhiteList" {
            if segue.destination is DeviceListTable {
               // destinationVC.numberToDisplay = counter
                navigationItem.title = nil
            }
        }
        
    }
    
}



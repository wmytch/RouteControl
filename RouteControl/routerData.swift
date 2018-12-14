//
//  routerData.swift
//  RouteControl
//
//  Created by Mac on 2018/4/3.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
class RouterData{
    
    let deviceList =
        [
            "00:12:7b:71:39:b6":"神舟",
            "58:44:98:79:bb:3b":"红米2a,老妈手机",
            "54:26:96:f3:a9:d4":"IPAD",
            "04:0c:ce:e1:45:3a":"MBA",
            "40:33:1a:ba:97:41":"IP5",
            "74:23:44:19:57:5d":"红米3s,老爸手机",
            "38:53:9c:de:63:7e":"IPXS",
            "94:87:e0:27:04:d9":"红米6p，老爸新手机"
           
        ]
    let  macPattern = "(\\w{2}:){5}\\w{2}"

    lazy var macList=Array(deviceList.keys)
    lazy var macRegex = try? NSRegularExpression(pattern: macPattern, options: NSRegularExpression.Options.caseInsensitive)

}

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
           
        ]
    let  macPattern = "(\\w{2}:){5}\\w{2}"

    lazy var macList=Array(deviceList.keys)
    lazy var macRegex = try? NSRegularExpression(pattern: macPattern, options: NSRegularExpression.Options.caseInsensitive)

}

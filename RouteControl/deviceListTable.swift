//
//  deviceListTable.swift
//  RouteControl
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 Mac. All rights reserved.
//  some thing 
import Foundation
import UIKit

class DeviceListTable:UITableViewController{
    let routerData=RouterData()

 
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableview :UITableView!)->Int{
        return 1
    }
    
    override func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return routerData.macList.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)-> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "deviceItemCell")
        let macItem=routerData.macList[indexPath.row]
        
        cell?.detailTextLabel?.text=macItem
        cell?.textLabel?.text=routerData.deviceList[macItem]
        return cell!
    }
}

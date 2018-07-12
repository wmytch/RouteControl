//
//  loginView.swift
//  RouteControl
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

import Foundation
import UIKit
import WebKit
//
class RouterViewController: UITableViewController {
    let routerData=RouterData()
    var macItemsFilterList=[NSTextCheckingResult]()
    var macItems=[String]()
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)

    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://192.168.211.1/wireless_state.asp")
        var request=URLRequest(url: url!)
        
        request.httpShouldHandleCookies=true
        request.addValue("admin:language=cn", forHTTPHeaderField: "Cookie")
        
        URLSession(configuration: .default).dataTask(with:request,completionHandler: {
            (data:Data?,response:URLResponse?,error:Error?) in
                let res=NSString(data: data!, encoding: String.Encoding.ascii.rawValue)
            
                let responseContent=String(describing: res)
            self.macItemsFilterList = self.routerData.macRegex.matches(in: responseContent, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, responseContent.count))
            for checkingRes in self.macItemsFilterList {
                self.macItems.append((responseContent as NSString).substring(with: checkingRes.range))
//              print(self.macItems)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).resume()
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableview :UITableView!)->Int{
        return 1
    }
    
    override func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return self.macItems.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)-> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "linkedDeviceItemCell")
        let macItem=self.macItems[indexPath.row]
        
        cell?.detailTextLabel?.text=macItem
        cell?.textLabel?.text=routerData.deviceList[macItem.lowercased()] ?? ""
        return cell!
    }
    
}

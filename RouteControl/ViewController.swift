//
//  ViewController.swift
//  RouteControl
//
//  Created by Mac on 2018/1/20.
//  Copyright © 2018年 Mac. All rights reserved.
//

//import UIKit
//import WebKit
////
//class ViewController: UIViewController,WKUIDelegate {
//    var webView: WKWebView!
//    let defaultMacList = UserDefaults.standard
//    let routerData=RouterData()
//
//
//
//    //获取导航栏高度
////    let navHeight = self.navigationController?.navigationBar.frame.height
////    //获取状态栏高度
////    let statusHeight = UIApplication.sharedApplication.statusBarFrame.height
////    webview = WKWebView(frame: CGRectMake(0, statusHeight+navHeight!,self.view.frame.width,self.view.frame.height))
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        let frame = CGRect(x:0, y:20, width:UIScreen.main.bounds.width,
//                           height:UIScreen.main.bounds.height)
//        //        let theWebView:WKWebView = WKWebView(frame:frame)
//        webView = WKWebView(frame:frame, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        // Do any additional setup after loading the view, typically from a nib.
//        defaultMacList.register(defaults: routerData.deviceList)
//        let path = Bundle.main.path(forResource: "router", ofType: ".html")
//        let url = URL(fileURLWithPath:path!)
//        let request = URLRequest(url:url)
//
//        //将浏览器视图全屏(在内容区域全屏,不占用顶端时间条)
//
//        //禁用页面在最顶端时下拉拖动效果
//        webView.scrollView.bounces = false
//        //加载页面
//        webView.load(request)
//        //self.view.addSubview(webView)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
////    func numberOfSectionsInTableView(tableview :UITableView!)->Int{
////        return 1
////    }
////
////    func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
////        return routerData.deviceList.count
////    }
////
////    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)-> UITableViewCell {
////        let cell=tableView.dequeueReusableCell(withIdentifier: "MacListCell")
////        let macList=Array(routerData.deviceList.keys)
////        let macItem=macList[indexPath.row]
////
////
////        cell?.textLabel?.text=macItem+":"+routerData.deviceList[macItem]!
////        print(cell?.textLabel?.text ?? "")
////        return cell!
////    }
//
//}
//
//
//
//

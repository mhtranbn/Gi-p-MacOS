//
//  MenuVC.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/19/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class MenuVC: UIViewController {
    var category : String = "hdhmac"


    override func viewDidLoad() {
        super.viewDidLoad()
        //add quang cao
        let bannerView = GADBannerView(frame: CGRect(x: 0, y: self.view.frame.height - 75 - (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.frame.width, height: 50))
        bannerView.adUnitID = "ca-app-pub-6539656833486891/1142539760"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["58643351-9AF2-4C00-A7D8-CCFEF7B663E5"]
        bannerView.loadRequest(request)
        self.navigationController?.navigationBar.addSubview(bannerView)
        //
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Giúp Mac"

        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkboard", size: 22)!, NSForegroundColorAttributeName: UIColor.blackColor()]
        
        let centerP = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
        
// button He dieu hanh mac os x
        
        var button1 = UIButton()
        button1 = UIButton(frame: CGRectMake(centerP.x - 30, centerP.y - 90, 60, 60))
        let imageb1 = UIImage(named: "he dieu hanh mac os x.png") as UIImage!
        button1.setBackgroundImage(imageb1, forState: .Normal)
        button1.addTarget(self, action: #selector(MenuVC.touchMac), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        var labelb1: UILabel = UILabel()
        labelb1 = UILabel(frame: CGRect(x: centerP.x - 65, y: centerP.y - 60, width: 190, height: 100))
        labelb1.text = (NSString(UTF8String: "Hệ điều hành Macintosh") as! String)
        
        labelb1.font = UIFont(name:"Chalkboard", size: 12)
        self.view.addSubview(labelb1)
        
// May tinh Apple
        
        var button2 = UIButton()
        button2 = UIButton(frame: CGRectMake(centerP.x - 30, centerP.y  + 30, 60, 60))
        let imageb2 = UIImage(named: "icon_Mac.png") as UIImage!
        button2.setBackgroundImage(imageb2, forState: .Normal)
        button2.addTarget(self, action: #selector(MenuVC.touchMay), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button2)
        
        var labelb2: UILabel = UILabel()
        labelb2 = UILabel(frame: CGRect(x: centerP.x - 38, y: centerP.y + 60, width: 80, height: 100))
        labelb2.text = (NSString(UTF8String: "Máy tính Mac") as! String)

        labelb2.font = UIFont(name: "Chalkboard", size: 12)
        self.view.addSubview(labelb2)
        // Do any additional setup after loading the view.
    }
    
// Su kien chon may tinh apple

    func touchMay() {
        
        
        let mayView = DetailScreen(category : "maymac")
        self.navigationController?.pushViewController(mayView, animated: false)
        
    }
    
//Su kien chon he dieu hanh mac os
    
    func touchMac() {
        let macView = DetailScreen(category: "hdhmac")
        self.navigationController?.pushViewController(macView, animated: false)
        
    }
   

}

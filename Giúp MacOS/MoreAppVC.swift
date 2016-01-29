//
//  MoreAppVC.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/19/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit
import Foundation
import GoogleMobileAds
class MoreAppVC: UIViewController {
    var viewRect:CGRect!
    var viewHeight: CGFloat!
    var viewWidth:CGFloat!
    weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Game của Hoàng"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkboard", size: 18)!, NSForegroundColorAttributeName: UIColor.blackColor()]

        self.viewRect = self.view.bounds
        self.viewWidth = viewRect.size.width
        self.viewHeight = viewRect.size.height
        let centerP = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
// game snake trong view
        
        let title = UILabel(frame: CGRect(x: centerP.x/3, y: 30, width: 190, height: 20))
        let game1 = UIButton(frame: CGRectMake(centerP.x - 30, centerP.y - 90, 60, 60))
        let image1 = UIImage(named: "App1.png") as UIImage!
        game1.setBackgroundImage(image1, forState: .Normal)
        game1.addTarget(self, action: "storeSnake", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(game1)
        let label1 = UILabel(frame: CGRect(x: centerP.x - 33, y: centerP.y - 20, width: 190, height: 20))
        label1.text = (NSString(UTF8String: "Snake 2025") as! String)
        label1.font = UIFont(name: "Chalkboard", size: 12)
        self.view.addSubview(label1)
        
// game imposiblee hyrry trong view
        
        let game2 = UIButton(frame: CGRectMake(centerP.x - 30, centerP.y + 30 , 60, 60))
        let image2 = UIImage(named: "icon copy.jpg") as UIImage!
        game2.setBackgroundImage(image2, forState: UIControlState.Normal)
        game2.addTarget(self, action: "touchImpossible", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(game2)
        let label2 = UILabel(frame: CGRect(x: centerP.x - 50, y: centerP.y + 100, width: 120, height: 20))
        label2.text = (NSString(UTF8String: "Impossible Hurry") as! String)
        label2.font = UIFont(name: "Chalkboard", size: 12)
        self.view.addSubview(label2)
        // Do any additional setup after loading the view.
        let bannerView = GADBannerView(frame: CGRect(x: 0, y: self.view.frame.height - 55 - (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.frame.width, height: 50))
        bannerView.adUnitID = "ca-app-pub-6539656833486891/1142539760"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = ["58643351-9AF2-4C00-A7D8-CCFEF7B663E5"]
        bannerView.loadRequest(request)
        self.view.addSubview(bannerView)
        
    }
    
    func storeSnake(){
        let url:NSURL? = NSURL(string: "itms-apps://itunes.apple.com/app/id964749497")
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
    func touchImpossible() {
        
        let url:NSURL? = NSURL(string: "itms-apps://itunes.apple.com/app/id966430780")
        UIApplication.sharedApplication().openURL(url!)
        
    }



}

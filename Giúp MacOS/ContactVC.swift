//
//  ContactVC.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/19/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit
import MessageUI
import Social

class ContactVC: UIViewController,UITextFieldDelegate,MFMailComposeViewControllerDelegate {

    var email:UILabel?
    var sdt:UILabel?
    var chuyenmuc: UILabel?
    var facebook: UILabel?
    var twiter: UILabel?
    var body:UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Góp ý vs Hoàng"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkboard", size: 20)!, NSForegroundColorAttributeName: UIColor.blackColor()]

        var centerPoint = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
        
        // add  email and sdt chuyen muc may tinh mac os cua tinh te
        
        sdt = UILabel(frame: CGRect(x: 20, y: centerPoint.y - 50, width: 300, height: 20))
        sdt?.text = "0984230489"
        sdt?.font = UIFont(name: "Chalkboard", size: 14)
        sdt?.textAlignment = NSTextAlignment.Left
        self.view.addSubview(sdt!)
        chuyenmuc = UILabel(frame: CGRect(x: 20, y: centerPoint.y , width: 400, height: 20))
        chuyenmuc?.font = UIFont(name:"Chalkboard", size: 14)
        chuyenmuc?.text = NSString(UTF8String: "www.tinhte.vn/forums/mac-hoi-dap-cskn.27/")
        chuyenmuc?.textAlignment = NSTextAlignment.Left
        self.view.addSubview(chuyenmuc!)
        chuyenmuc?.userInteractionEnabled = true
        chuyenmuc?.multipleTouchEnabled = true
        let voTinhte = UITapGestureRecognizer(target: self, action: "voTinhte:")
        chuyenmuc?.addGestureRecognizer(voTinhte)
        email = UILabel(frame: CGRect(x: 20, y: centerPoint.y - 100, width: 300, height: 20))
        email?.text = "tranmanhhoang@gmail.com"
        
        email?.textColor = UIColor.blueColor()
        email?.font = UIFont(name: "Chalkboard", size: 14)
        email?.textAlignment = NSTextAlignment.Left
        self.view.addSubview(email!)
        email?.multipleTouchEnabled = true
        email?.userInteractionEnabled = true
        var guimail: UITapGestureRecognizer?
        guimail = UITapGestureRecognizer(target: self, action: "guiMail:")
        email?.addGestureRecognizer(guimail!)
        sdt?.multipleTouchEnabled = true
        sdt?.userInteractionEnabled = true
        let callHoang = UITapGestureRecognizer(target: self, action: "calHoang:")
        sdt?.addGestureRecognizer(callHoang)
        
        facebook = UILabel(frame: CGRect(x: 20, y: centerPoint.y + 50, width: 200, height: 20))
        facebook?.font = UIFont(name: "Chalkboard", size: 14)
        facebook?.text = NSString(UTF8String: "Share Facebook")
        self.view.addSubview(facebook!)
        facebook?.textAlignment = NSTextAlignment.Left
        facebook?.userInteractionEnabled = true
        facebook?.multipleTouchEnabled = true
        let shareF = UITapGestureRecognizer(target: self, action: "showFaceBook:")
        facebook?.addGestureRecognizer(shareF)
        
        
        twiter = UILabel(frame: CGRect(x: 20, y: centerPoint.y + 100, width: 200, height: 20))
        twiter?.font = UIFont(name: "Chalkboard", size: 14)
        twiter?.text = NSString(UTF8String: "Share Twiter")
         self.view.addSubview(twiter!)
        twiter?.textAlignment = NSTextAlignment.Left
        twiter?.userInteractionEnabled = true
        twiter?.multipleTouchEnabled = true
        let sharet = UITapGestureRecognizer(target: self, action: "showTweetSheet:")
        twiter?.addGestureRecognizer(sharet)
        self.view.addSubview(twiter!)

        
        
        // Do any additional setup after loading the view.
    }
    
    func voTinhte(votinhte: UITapGestureRecognizer){
        var url = NSURL(string: "http://www.tinhte.vn/forums/mac-hoi-dap-cskn.27/")
        UIApplication.sharedApplication().openURL(url!)
        
    }
    
    func calHoang(tap: UITapGestureRecognizer) {
        var url = NSURL(string: "tel:0984230489")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func guiMail(guimail: UITapGestureRecognizer) {
        var SubjectText = " Giúp Mac! "
        //        SubjectText +=
        var mesaageBody = body
        var nguoinhan = ["tranmanhhoang@gmail.com"]
        var mc : MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(SubjectText)
        mc.setMessageBody(mesaageBody?.text, isHTML: false)
        mc.setToRecipients(nguoinhan)
//        self.presentedViewController(mc , animated: true , completion: nil)
        self.presentViewController(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value{
        case  MFMailComposeResultCancelled.value:
            NSLog("Mail cancel")

        case MFMailComposeResultFailed.value:
            NSLog("Mail fail : %@",[error.localizedDescription])
        case MFMailComposeResultSaved.value:
            NSLog("Maiil Save")
        case MFMailComposeResultSent.value:
            NSLog("Mail sent")
        default:
            break
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func showFaceBook(shareF: UITapGestureRecognizer) {
        let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)

        
        facebook.setInitialText("Ứng dụng hay cho người dùng Mac.")
        facebook.addImage(UIImage(named: "GiupMacOs.png")) //Add an image if you like?
        facebook.addURL(NSURL(string: "https://itunes.apple.com/app/id981002647")) //A url which takes you into safari if tapped on
        
        self.presentViewController(facebook, animated: false, completion: {
//
        })
        
    }
    
    func showTweetSheet(sharet: UITapGestureRecognizer) {
        let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)

        
        tweetSheet.setInitialText("Ứng dụng hay cho người dùng Mac.") //The default text in the tweet
        tweetSheet.addImage(UIImage(named: "GiupMacOs.png")) //Add an image if you like?
        tweetSheet.addURL(NSURL(string: "https://itunes.apple.com/app/id981002647")) //A url which takes you into safari if tapped on
        
        self.presentViewController(tweetSheet, animated: false, completion: {
//            //Optional completion statement
        })
    }



}

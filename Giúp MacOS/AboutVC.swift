//
//  AboutVC.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/19/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit

class AboutVC: UIViewController,UIScrollViewDelegate {
    var textView: UITextView!
    var autoscroolTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.backgroundColor = UIColor(red: 179/255, green: 99/255, blue: 114/255, alpha: 1)
        self.navigationController!.setNavigationBarHidden(true, animated: true)
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        if (autoscroolTimer == nil) {
            autoscroolTimer = NSTimer.scheduledTimerWithTimeInterval(50.0/1000.0, target: self, selector: "autoscrollTimeFired", userInfo: nil, repeats: true)
        }
        autoscroolTimer = NSTimer.scheduledTimerWithTimeInterval(50.0/1000.0, target: self, selector: "autoscrollTimeFired", userInfo: nil, repeats: true)


        textView = UITextView(frame : CGRect(x:10, y:60, width:(screenWidth-20), height: (screenHeight+220) ))
        textView.backgroundColor = UIColor(red: 179/255, green: 99/255, blue: 114/255, alpha: 1)
         textView.text = "     \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nMột chiếc máy Mac là một tác phẩm nghệ thuật, nó đẹp từ bên ngoài vào đến bên trong. Và hệ điều hành Mac cũng là một nghệ thuật và dễ sử dụng, nổi tiếng thân thiện với người dùng và mang lại những trải nghiệm tuyệt vời. Những khó chịu ban đầu có lẽ phần nhiều là do đã quá quen Windows. Sử dụng Mac còn tránh được việc diệt Virus và hạn chế tối đa việc cài lại hệ điều hành người dùng thoải mái mày mò tìm tòi nhiều để có thể xài hết chức năng của máy, một điều mà người đam mê công nghệ hay mới tập tành xài Mac sẽ có được. Ứng dụng cung cấp những kiến thức, kinh nghiệm, tip cơ bản nhất dành cho những người mới bước đầu dấn thân vào con đường Mac. Ứng dụng tạo cho người dùng cảm giác khá là thú vị, dễ làm quen."
        textView.editable = false
        textView.selectable = true
        textView.font = UIFont(name: "Chalkboard", size: 14)
        self.view.addSubview(textView!)

}

    func autoscrollTimeFired() {
        var scrollPoint: CGPoint = self.textView.contentOffset
        scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y + 1)
        self.textView.setContentOffset(scrollPoint, animated: false)
    }
    
}


//
//  Detail.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/22/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit

class Detail: UIViewController,UIScrollViewDelegate {
    var imageCenter: UIImageView?
    var textView: UITextView!
    var data: DetailStr?
    init (data:DetailStr)
    {
        super.init(nibName: nil, bundle: nil);
        self.data = data
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
        let centerPoint = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            imageCenter = UIImageView(frame:CGRect(x: 0, y: 0, width: 2 * centerPoint.x - 320, height: 2 * centerPoint.x - 320))
            imageCenter?.center = CGPoint(x: centerPoint.x , y: imageCenter!.bounds.height / 2 + 10)
            imageCenter?.image = UIImage(named: data!.imagePath)
            self.view.addSubview(imageCenter!)
        } else {
            imageCenter = UIImageView(frame:CGRect(x: 0, y: 0, width: 2 * centerPoint.x - 120, height: 2 * centerPoint.x - 120))
            imageCenter?.center = CGPoint(x: centerPoint.x , y: imageCenter!.bounds.height / 2 + 10)
            imageCenter?.image = UIImage(named: data!.imagePath)
            self.view.addSubview(imageCenter!)
        }

        textView = UITextView(frame: CGRect(x: 30, y: centerPoint.y - 20, width: centerPoint.x * 2 - 60, height: centerPoint.y - 150))
        textView.text = data!.detail
        textView.editable = false
        textView.selectable = true
        textView.font = UIFont(name: "Chalkboard", size: 11)
        self.view.addSubview(textView)
        let scroolPoint: CGPoint = self.textView.contentOffset
        self.textView.setContentOffset(scroolPoint, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let back : UIBarButtonItem = UIBarButtonItem(title: "<- Quay lại", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(Detail.backview))
        if let font = UIFont(name: "Chalkboard", size: 16) {
            back.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
        self.navigationItem.leftBarButtonItem = back

    }
    func backview() {
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(false)
        }
    }


}

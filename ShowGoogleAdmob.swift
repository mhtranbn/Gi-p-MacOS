//
//  ShowGoogleAdmob.swift
//  Giúp Mac
//
//  Created by mhtran on 3/23/16.
//  Copyright © 2016 mhtran. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import SystemConfiguration

class showGoogleAdmob: UIView {
    private var _adModView : UIView = UIView()
    var adMobView : UIView {
        get {
            return _adModView
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        fatalError("NScoding not support")
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func showAdmod() {
        
    }
}
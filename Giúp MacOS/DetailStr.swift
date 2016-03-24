//
//  DetailStr.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/21/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import Foundation
import UIKit

class DetailStr {
    private var _title: String = "Tieu de"
    var title : String {
        get {
            return _title
        }
    }
    
    private var _detail: String = "Cu the"
    var detail : String {
        get {
            return _detail
        }
    }
    
    private var _imagePath: String = "locationImage"
    var imagePath : String {
        get {
            return _imagePath
        }
    }
    
    init (title: String, imagePath: String, detail: String = "no detail") {
        self._title = title
        self._detail = detail
        self._imagePath = imagePath
        
    }
}

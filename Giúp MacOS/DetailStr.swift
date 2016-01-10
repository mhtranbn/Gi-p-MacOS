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
    var title: String
    var detail: String
    var imagePath: String
    init (title: String, imagePath: String, detail: String = "no detail") {
        self.title = title
        self.detail = detail
        self.imagePath = imagePath
        
    }
}

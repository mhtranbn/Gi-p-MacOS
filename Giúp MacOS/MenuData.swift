//
//  MenuData.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/21/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import Foundation
class MenuData {
    var category: String
    var detailData = Array<DetailStr>()
    init(category: String){
        self.category = category
    }
    
    func addData(title: String, imagePath: String, detail: String = "") {
        detailData.append(DetailStr(title: title, imagePath: imagePath, detail: detail))
    }
}

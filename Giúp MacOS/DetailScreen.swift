//
//  DetailScreen.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/20/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit
import GoogleMobileAds
import SystemConfiguration

class View: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class DetailScreen: UITableViewController {

    var cellID = "#"
    var t: Int = 0
    var tg: Int = 0
    var data: MenuData?
    override func viewDidLoad() {
        super.viewDidLoad()
        let back : UIBarButtonItem = UIBarButtonItem(title: "<- Quay lại", style: UIBarButtonItemStyle.Plain, target: self, action: "backview")
        if let font = UIFont(name: "Chalkboard", size: 16) {
            back.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }

        self.navigationItem.leftBarButtonItem = back
        tableView.backgroundColor = UIColor(red: 50, green: 10, blue: 100, alpha: 0.4)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let nibCell = UINib(nibName: "DetailVC~ipad", bundle: nil)
            self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        } else {
            let nibCell = UINib(nibName: "DetailVC", bundle: nil)
            self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        }

        self.clearsSelectionOnViewWillAppear = false
    }

    func backview() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func setData(data:MenuData) {
        self.data = data
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.detailData.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DetailVC!
        if let dequecell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as? DetailVC {
            cell = dequecell
        }

        // Configure the cell...
        let detailStr = data!.detailData[indexPath.row] as DetailStr
        cell.title.text = detailStr.title
        cell.imageDe.image = UIImage(named: detailStr.imagePath)

        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(Detail(data:data!.detailData[indexPath.row]), animated: true)
        
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0,0,tableView.frame.size.width, 50))
        return footerView
    }

    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if Reachability.isConnectedToNetwork() == false {
            return 0
        }
        
        else {
          return 50
        }
    }

}

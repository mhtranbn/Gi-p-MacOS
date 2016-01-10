//
//  DetailScreen2.swift
//  Giúp MacOS
//
//  Created by mhtran on 3/25/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit



class DetailScreen2: UITableViewController {
    
    var cellID = "#"
    var t: Int = 0
    var SelectedItems: [String: Bool] = [:]
    var data: MenuData?

    override func viewDidLoad() {
        super.viewDidLoad()
//        var nibCell
        tableView.backgroundColor = UIColor(red: 50, green: 10, blue: 100, alpha: 0.4)
        let back : UIBarButtonItem = UIBarButtonItem(title: "<- Quay lại", style: UIBarButtonItemStyle.Plain, target: self, action: "backview")
        if let font = UIFont(name: "Chalkboard", size: 16) {
            back.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
        self.navigationItem.leftBarButtonItem = back
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let nibCell = UINib(nibName: "DetailVC~ipad", bundle: nil)
            self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        } else {
            let nibCell = UINib(nibName: "DetailVC", bundle: nil)
            self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        }
        
        
        
        
        
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return NSString(bytes: &sysinfo.machine, length: Int(_SYS_NAMELEN), encoding: NSASCIIStringEncoding)! as String
    }

    func backview() {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    func setData(data:MenuData) {
        self.data = data
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
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
        self.navigationController?.pushViewController(Detail(data: data!.detailData[indexPath.row]), animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

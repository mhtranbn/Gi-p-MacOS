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
import CoreData

class View: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class DetailScreen: UITableViewController {

    var cellID = "#"
    private var _category : String = "hdhmac"
    var category : String {
        get {
            return _category
        }
    }
    init (category: String) {
        self._category = category
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    var giupMac : [GiupMac] = []
    var managedObjectContext : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let back : UIBarButtonItem = UIBarButtonItem(title: "<- Quay lại", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(DetailScreen.backview))
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
        
        let coreData = CoreData()
        managedObjectContext = coreData.managedObjectContext
        
    }
    
    override func viewWillAppear(animated: Bool) {
        loadData()
    }
    
    func loadData() {
        
        let request = NSFetchRequest(entityName:"GiupMac")
        request.predicate = NSPredicate(format: "kindof = %@" , category)
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]

            
        do {
            giupMac = try managedObjectContext.executeFetchRequest(request) as! [GiupMac]
            
            tableView.reloadData()
        }
        catch {
            fatalError("Error in retrieving giupMac help")
        }
    }

    func backview() {
        navigationController?.popToRootViewControllerAnimated(false)
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giupMac.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DetailVC!
        if let dequecell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as? DetailVC {
            cell = dequecell
        }

        // Configure the cell...
        let detailStr = giupMac[indexPath.row]
        
        cell.title.text = detailStr.title
        cell.imageDe.image = UIImage(named: detailStr.image!)

        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailStr = giupMac[indexPath.row]
        
        let detailVCMain = Detail(data: DetailStr(title: detailStr.detail!, imagePath: detailStr.image!, detail: detailStr.detail!))
        self.navigationController?.pushViewController(detailVCMain, animated: false)
        
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
            let bannerView = GADBannerView(frame: CGRect(x: 0, y: self.view.frame.height - 55 - (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.frame.width, height: 50))
            bannerView.adUnitID = "ca-app-pub-6539656833486891/1142539760"
            bannerView.rootViewController = self
            let request = GADRequest()
            request.testDevices = ["58643351-9AF2-4C00-A7D8-CCFEF7B663E5"]
            bannerView.loadRequest(request)
            self.view.addSubview(bannerView)
          return 50
            
        }
    }

}

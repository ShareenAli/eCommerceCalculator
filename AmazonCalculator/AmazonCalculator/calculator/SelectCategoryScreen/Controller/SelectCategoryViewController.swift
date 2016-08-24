//
//  SelectCategoryViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 02/08/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class SelectCategoryViewController: UIViewController, GetCategoryParserDelegate, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate
{
    var backButtonLabel : UILabel?
    var selectCategoryLabel : UILabel?
    var searchCategorySearchBar : UISearchBar?
    var categoryTableView : UITableView?
    var loadTable : GetCategoryParser?
    var categories : [GetCategoryModel]?
    var ac : UIActivityIndicatorView?
    
    var alert : UIAlertView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadComponents()
        getAllCategoryParser()
    }
    
    func loadComponents()
    {
        if selectCategoryLabel == nil
        {
    
            backButtonLabel = UILabel(frame: CGRectMake(0, 10, 40, 40))
            backButtonLabel!.backgroundColor = UIColor.whiteColor()
            backButtonLabel!.text = "<"
            backButtonLabel!.textAlignment = .Center
            backButtonLabel!.font = UIFont.systemFontOfSize(15)
            backButtonLabel!.userInteractionEnabled = true
            self.view.addSubview(backButtonLabel!)
            
            selectCategoryLabel = UILabel(frame: CGRectMake(40, 10, self.view.frame.size.width-40, 40))
            selectCategoryLabel!.backgroundColor = UIColor.whiteColor()
            selectCategoryLabel!.text = "Select Category"
            selectCategoryLabel!.textAlignment = .Center
            selectCategoryLabel!.font = UIFont.systemFontOfSize(15)
            self.view.addSubview(selectCategoryLabel!)
            
        }
    }
    
    func getAllCategoryParser()
    {
        print("Success")
        ac = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        ac!.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2)
        ac!.startAnimating()
        view.addSubview(ac!)
        
        if loadTable == nil
        {
            loadTable = GetCategoryParser()
            loadTable!.delegate = self
            loadTable!.getCategory()
        }
    }
    
    func loadCategoryTable()
    {
        searchCategorySearchBar = UISearchBar(frame : CGRectMake(10,60,self.view.frame.size.width-20, 40))
        searchCategorySearchBar!.backgroundColor = UIColor.whiteColor()
        searchCategorySearchBar!.placeholder = "Search category"
//        searchCategorySearchBar!.layer.borderColor = UIColor.orangeColor().CGColor
//        searchCategorySearchBar!.layer.borderWidth = 1.0
        searchCategorySearchBar!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
//        searchCategorySearchBar!.layer.cornerRadius = 5.0
        self.view.addSubview(searchCategorySearchBar!)

        
        if categoryTableView == nil
        {
            categoryTableView = UITableView(frame: CGRectMake(10, 110, self.view.frame.size.width-20, self.view.frame.size.height - 110))
            categoryTableView!.delegate = self
            categoryTableView!.dataSource = self
            self.view.addSubview(categoryTableView!)
        }
    }
    
    func didReceivedCategory(categories category : [GetCategoryModel])
    {
        loadTable = nil
        categories = category
        loadCategoryTable()
        ac!.stopAnimating()
        
    }
    
    func didReceivedCategoryWithError(status status : Int)
    {
       ac!.stopAnimating()
        
        if status == AppConstant.Static.CONNECTION_ERROR
        {
            alert = UIAlertView(title: "Amazon Calculator", message:"Connection Error", delegate: self, cancelButtonTitle: "OK")
            alert!.show()
        }
        else if  status == AppConstant.Static.PROCESSING_ERROR
        {
            alert = UIAlertView(title: "Amazon Calculator", message:"Processing Error", delegate: self, cancelButtonTitle: "OK")
            alert!.show()
        }

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return categories!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell?
        cell = tableView.dequeueReusableCellWithIdentifier("Cell") 
        if cell == nil
        {
        cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        cell!.textLabel!.text = categories![indexPath.row].categoryName
        cell!.textLabel!.font = UIFont.systemFontOfSize(15.0)
        cell!.textLabel!.numberOfLines = 0
        cell!.textLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return cell!
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!

        if touch.view == backButtonLabel
        {
            self.navigationController!.popViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning()
    {
    super.didReceiveMemoryWarning()
    }
}
//
//  OverallCalcScreenViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 22/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class OverallCalcScreenViewController: UIViewController {
    
    var overallCalcAnalysisLabel : UILabel?
    var scrollView : UIScrollView?
    var productName : UILabel?
    var totalProductCostTextField : UILabel?
    var productBasePrice : UILabel?
    var shippingCharge : UILabel?
    var pickAndPack : UILabel?
    var weightHandlingFee : UILabel?
    var amazonReferralFees : UILabel?
    var amazonClosingFees : UILabel?
    var amazonShippingCharge : UILabel?
    var factorsReturns1 :UILabel?
    var factorsReturns2 : UILabel?
    var serviceTaxCharge : UILabel?
    var vatCharge : UILabel?
    var totalFromAmazon : UILabel?
    var totalProfit : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func viewWillAppear(animated: Bool)
    {
        loadLabel()
        loadScrollView()
        loadLabels()
    }
    
    func loadLabel()
    {
        overallCalcAnalysisLabel = UILabel(frame: CGRectMake(0,10,self.view.frame.size.width,40))
        overallCalcAnalysisLabel!.backgroundColor = UIColor.redColor()
        overallCalcAnalysisLabel!.text = "Overall Calculation Analysis"
        overallCalcAnalysisLabel!.textColor = UIColor.whiteColor()
        overallCalcAnalysisLabel!.font = UIFont.systemFontOfSize(13.0)
        overallCalcAnalysisLabel!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(overallCalcAnalysisLabel!)
    }

    func loadScrollView()
    {
        scrollView = UIScrollView(frame : CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height))
        scrollView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(scrollView!)
    }
    
    func loadLabels()
    {
        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
        productName!.layer.borderColor = UIColor.redColor().CGColor
        productName!.layer.borderWidth = 1.0
        productName!.text = "  Product Name :"
        productName!.textColor = UIColor.grayColor()
        productName!.font = UIFont.systemFontOfSize(12.0)
        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        productName!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productName!)
        
//        totalProductCostTextField = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        totalProductCostTextField!.layer.borderColor = UIColor.redColor().CGColor
//        totalProductCostTextField!.layer.borderWidth = 1.0
//        totalProductCostTextField!.text = "  Total Product Cost :"
//        totalProductCostTextField!.textColor = UIColor.grayColor()
//        totalProductCostTextField!.font = UIFont.systemFontOfSize(12.0)
//        totalProductCostTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        totalProductCostTextField!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(totalProductCostTextField!)
//        
//        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        productName!.layer.borderColor = UIColor.redColor().CGColor
//        productName!.layer.borderWidth = 1.0
//        productName!.text = "  Product Name :"
//        productName!.textColor = UIColor.grayColor()
//        productName!.font = UIFont.systemFontOfSize(12.0)
//        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        productName!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(productName!)
//        
//        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        productName!.layer.borderColor = UIColor.redColor().CGColor
//        productName!.layer.borderWidth = 1.0
//        productName!.text = "  Product Name :"
//        productName!.textColor = UIColor.grayColor()
//        productName!.font = UIFont.systemFontOfSize(12.0)
//        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        productName!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(productName!)
//        
//        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        productName!.layer.borderColor = UIColor.redColor().CGColor
//        productName!.layer.borderWidth = 1.0
//        productName!.text = "  Product Name :"
//        productName!.textColor = UIColor.grayColor()
//        productName!.font = UIFont.systemFontOfSize(12.0)
//        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        productName!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(productName!)
//        
//        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        productName!.layer.borderColor = UIColor.redColor().CGColor
//        productName!.layer.borderWidth = 1.0
//        productName!.text = "  Product Name :"
//        productName!.textColor = UIColor.grayColor()
//        productName!.font = UIFont.systemFontOfSize(12.0)
//        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        productName!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(productName!)
//        
//        productName = UILabel(frame: CGRectMake(10,10,self.view.frame.size.width - 20, 30))
//        productName!.layer.borderColor = UIColor.redColor().CGColor
//        productName!.layer.borderWidth = 1.0
//        productName!.text = "  Product Name :"
//        productName!.textColor = UIColor.grayColor()
//        productName!.font = UIFont.systemFontOfSize(12.0)
//        productName!.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        productName!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(productName!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

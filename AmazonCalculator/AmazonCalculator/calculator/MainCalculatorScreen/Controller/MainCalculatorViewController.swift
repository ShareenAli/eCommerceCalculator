//
//  MainCalculatorViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 29/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class MainCalculatorViewController: UIViewController, AFNViewDelegate, MFNViewDelegate {

    var AFNCalculatorLabel : UILabel?
    var MFNCalculatorLabel : UILabel?
    var bottomView1 : UIView?
    var bottomView2 : UIView?
    var afnView : AFNView?
    var mfnView : MFNView?
    
    var firstScreen : Bool? = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadComponents()
        loadCalculatorViews()
    }

    func loadComponents()
    {
        AFNCalculatorLabel = UILabel(frame: CGRectMake(0, 10, self.view.frame.size.width/2, 40))
        AFNCalculatorLabel!.backgroundColor = UIColor.whiteColor()
        AFNCalculatorLabel!.text = "AFN Calculator"
        AFNCalculatorLabel!.textAlignment = .Center
        AFNCalculatorLabel!.userInteractionEnabled = true
        AFNCalculatorLabel!.textColor = UIColor.blackColor()
        AFNCalculatorLabel!.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(AFNCalculatorLabel!)
        
        MFNCalculatorLabel = UILabel(frame: CGRectMake(self.view.frame.size.width/2 , 10, self.view.frame.size.width/2, 40))
        MFNCalculatorLabel!.backgroundColor = UIColor.whiteColor()
        MFNCalculatorLabel!.text = "MFN Calculator"
        MFNCalculatorLabel!.textAlignment = .Center
        MFNCalculatorLabel!.userInteractionEnabled = true
        MFNCalculatorLabel!.textColor = UIColor.grayColor()
        MFNCalculatorLabel!.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(MFNCalculatorLabel!)
        
        bottomView1 = UIView(frame: CGRectMake(0, 50, self.view.frame.size.width/2 , 2))
        bottomView1!.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(bottomView1!)
        
        bottomView2 = UIView(frame: CGRectMake(self.view.frame.size.width/2, 50, self.view.frame.size.width/2 , 2))
        bottomView2!.backgroundColor = UIColor.orangeColor()
        bottomView2!.hidden = true
        self.view.addSubview(bottomView2!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadCalculatorViews()
    {
        afnView = AFNView(frame: CGRectMake(0,52, self.view.frame.size.width, self.view.frame.size.height))
        afnView!.delegate = self
        self.view.addSubview(afnView!)
    
        mfnView = MFNView(frame: CGRectMake(0,52, self.view.frame.size.width, self.view.frame.size.height))
        mfnView!.delegate = self
        self.view.addSubview(mfnView!)
        mfnView!.hidden = true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        
        if touch.view! == AFNCalculatorLabel
        {
            AFNCalculatorLabel!.textColor = UIColor.blackColor()
            MFNCalculatorLabel!.textColor = UIColor.grayColor()
            bottomView2!.hidden = true
            bottomView1!.hidden = false
            firstScreen = true
            afnView!.hidden = false
            mfnView!.hidden = true
            
        }
        else if touch.view! == MFNCalculatorLabel
        {
            AFNCalculatorLabel!.textColor = UIColor.grayColor()
            MFNCalculatorLabel!.textColor = UIColor.blackColor()
            bottomView2!.hidden = false
            bottomView1!.hidden = true
            firstScreen = false
            mfnView!.hidden = false
            afnView!.hidden = true
        }
    }
    
    //MARK:  AFNViewDelegate callback
    
    func didReceivedAFNViewStatus(status status : Int, message : String?)
    {
        if status == afnView!.formSuccessStatus
        {
            
        }
        else
        {
            let alert = UIAlertView(title: "Amazon Calculator", message: message, delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    func didReceivedMFNViewStatus(status status : Int, message : String?)
    {
    }
    
    func productReferralFeesTextFieldStatus(isError: Bool) {
        if isError == true
        {
            let alert = UIAlertView(title: "Amazon Calculator", message:"Product base price can not be empty.", delegate: self, cancelButtonTitle: "OK")
            alert.show()

        }
        else
        {
            let categoryController = SelectCategoryViewController()
            self.navigationController!.pushViewController(categoryController, animated: true)
        }
    }
}
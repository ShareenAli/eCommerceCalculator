//
//  OTPViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 29/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController, GetOTPParserDelegate {

    var containerScreen : UIView?
    var containerLabel : UILabel?
    var messageTextView : UITextView?
    var mobileOTPTextField : UITextField?
    var emailOTPTextField : UITextField?
    var verifyButton : UIButton?
    var generateOTPButton : UIButton?
    var textFieldView : UIView?
    var textFieldView2 : UIView?
    var getOtpParser : GetOTPParser?
    
    var otp : String?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        callGetOtpParser()
    }

    func loadComponents()
    {
        
        if containerScreen == nil
        {
            containerScreen = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width-20, (self.view.frame.size.height/2)-70))
            containerScreen!.backgroundColor = UIColor.whiteColor()
            containerScreen!.center = self.view.center
            containerScreen!.layer.cornerRadius = 5.0
            
            self.view.addSubview(containerScreen!)
        
            containerLabel = UILabel(frame: CGRectMake(0, 20,self.view.frame.size.width-40 , 30))
            containerLabel!.backgroundColor = UIColor.whiteColor()
            containerLabel!.text = "AMAZON CALCULATOR"
            containerLabel!.textColor = UIColor.orangeColor()
            containerLabel!.textAlignment = .Center
            containerLabel!.font = UIFont.systemFontOfSize(18)
            containerScreen!.addSubview(containerLabel!)
            
            messageTextView = UITextView(frame: CGRectMake(10, 60,self.view.frame.size.width - 40 , 40))
            messageTextView!.backgroundColor = UIColor.whiteColor()
            messageTextView!.text = "To make things secure we are sending OTP in two parts. One on SMS and one on Email ID"
            messageTextView!.textColor = UIColor.grayColor()
            messageTextView!.textAlignment = .Center
            messageTextView!.font = UIFont.systemFontOfSize(12)
            containerScreen!.addSubview(messageTextView!)
            
            mobileOTPTextField = UITextField(frame: CGRectMake(10,110,self.view.frame.size.width - 40, 30))
            mobileOTPTextField!.placeholder = "Mobile OTP"
            mobileOTPTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
            mobileOTPTextField!.keyboardType = UIKeyboardType.PhonePad
            mobileOTPTextField!.textAlignment = .Center
            containerScreen!.addSubview(mobileOTPTextField!)
            
            textFieldView = UIView(frame: CGRectMake(10, 140, self.view.frame.size.width - 40, 1))
            textFieldView!.backgroundColor = UIColor.orangeColor()
            containerScreen!.addSubview(textFieldView!)
                
            emailOTPTextField = UITextField(frame: CGRectMake(10,150,self.view.frame.size.width - 40, 30))
            emailOTPTextField!.placeholder = "EmailID OTP"
            emailOTPTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
            emailOTPTextField!.keyboardType = UIKeyboardType.PhonePad
            emailOTPTextField!.textAlignment = .Center
            containerScreen!.addSubview(emailOTPTextField!)
            
            textFieldView2 = UIView(frame: CGRectMake(10, 180, self.view.frame.size.width - 40, 1))
            textFieldView2!.backgroundColor = UIColor.orangeColor()
            containerScreen!.addSubview(textFieldView2!)
            
            verifyButton = UIButton(type: UIButtonType.Custom)
            verifyButton!.frame = CGRectMake(10, 200, (self.view.frame.size.width/2)-25, 40)
            verifyButton!.backgroundColor = UIColor.orangeColor()
            verifyButton!.setTitle("VERIFY", forState: UIControlState.Normal)
            verifyButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            verifyButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
            verifyButton!.layer.cornerRadius = 5.0
            verifyButton!.addTarget(self, action:#selector(self.verifyButtonClicked), forControlEvents: .TouchUpInside)
            containerScreen!.addSubview(verifyButton!)
        
            generateOTPButton = UIButton(type: UIButtonType.Custom)
            generateOTPButton!.frame = CGRectMake((self.view.frame.size.width/2)-5, 200, (self.view.frame.size.width/2)-25, 40)
            generateOTPButton!.backgroundColor = UIColor.orangeColor()
            generateOTPButton!.setTitle("GENERATE OTP", forState: UIControlState.Normal)
            generateOTPButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            generateOTPButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
            generateOTPButton!.layer.cornerRadius = 5.0
            generateOTPButton!.addTarget(self, action:#selector(self.generateOTPButtonClicked), forControlEvents: .TouchUpInside)
            containerScreen!.addSubview(generateOTPButton!)
        
        }
    }
    
    func callGetOtpParser()
    {
        print("Success")
        
        if getOtpParser == nil
        {
            getOtpParser = GetOTPParser()
            getOtpParser!.delegate = self
            
            let mobileNo = String(NSUserDefaults.standardUserDefaults().valueForKey("mobileNo")!)
            let email = NSUserDefaults.standardUserDefaults().valueForKey("email") as! String
            getOtpParser!.getOTP(mobileNo, emailid: email)
        }
 
    }
    
    func didReceivedGetOTPStatus(resultCode resultCode : Int, otp : String?)
    {
        getOtpParser = nil
        if resultCode == AppConstant.Static.OTP_SUCCESS
        {
            self.otp = otp!
            loadComponents()
        }
        else
        {
            if resultCode == AppConstant.Static.CONNECTION_ERROR
            {
                let alert = UIAlertView(title: "Amazon Calculator", message:"Connection Error", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
            else if  resultCode == AppConstant.Static.PROCESSING_ERROR
            {
                let alert = UIAlertView(title: "Amazon Calculator", message:"Processing Error", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
            
        }
    }
    
    func verifyButtonClicked()
    {
        if mobileOTPTextField!.text!.isEmpty
        {
            let alert = UIAlertView(title: "Amazon Calculator", message:"Please enter your mobile OTP", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if emailOTPTextField!.text!.isEmpty
        {
            let alert = UIAlertView(title: "Amazon Calculator", message:"Please enter your email OTP", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else
        {
            var enteredOTP = mobileOTPTextField!.text! + emailOTPTextField!.text!
            if enteredOTP != otp
            {
                let alert = UIAlertView(title: "Amazon Calculator", message:"Invalid OTP", delegate: self, cancelButtonTitle: "OK")
                alert.show()
            }
            else
            {
                print("otp success....")
                let mainCalculatorViewController = MainCalculatorViewController()
                self.navigationController!.pushViewController(mainCalculatorViewController, animated: true)
                
            }
        }
        
    }
    
    func generateOTPButtonClicked()
    {
        mobileOTPTextField!.text = ""
        emailOTPTextField!.text = ""
        callGetOtpParser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
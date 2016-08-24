//
//  RegistrationViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 28/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController,RegisterUserParserDelegate, GetOTPParserDelegate {
    
    var containerScreen : UIView?
    var registrationLabel : UILabel?
    var userNameTextField : UITextField?
    var mobileNumberTextField : UITextField?
    var emailIdTextField : UITextField?
    var registerButton : UIButton?
    var registrationParser : RegisterUserParser?
    var otpParser : GetOTPParser?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadComponents()
    }
    
    func loadComponents()
    {
        if containerScreen == nil {
            containerScreen = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2))
            containerScreen!.center = self.view.center
            self.view.addSubview(containerScreen!)
            
            registrationLabel = UILabel(frame: CGRectMake(0, 0,self.view.frame.size.width , 30))
            registrationLabel!.backgroundColor = UIColor.whiteColor()
            registrationLabel!.text = "Registration"
            registrationLabel!.textColor = UIColor.orangeColor()
            registrationLabel!.textAlignment = .Center
            registrationLabel!.font = UIFont.systemFontOfSize(18)
            containerScreen!.addSubview(registrationLabel!)
            
            userNameTextField = UITextField(frame: CGRectMake(10,50,self.view.frame.size.width - 20, 40))
            userNameTextField!.layer.borderColor = UIColor.orangeColor().CGColor
            userNameTextField!.layer.borderWidth = 1.0
            userNameTextField!.placeholder = " User Name"
//            userNameTextField!.text = "Anil"
            userNameTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
            userNameTextField!.layer.cornerRadius = 5.0
            containerScreen!.addSubview(userNameTextField!)
            
            mobileNumberTextField = UITextField(frame: CGRectMake(10,100,self.view.frame.size.width - 20, 40))
            mobileNumberTextField!.layer.borderColor = UIColor.orangeColor().CGColor
            mobileNumberTextField!.layer.borderWidth = 1.0
            mobileNumberTextField!.placeholder = " Mobile No."
//            mobileNumberTextField!.text = "9967456776"
            mobileNumberTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
            mobileNumberTextField!.layer.cornerRadius = 5.0
            mobileNumberTextField!.keyboardType = UIKeyboardType.PhonePad
            containerScreen!.addSubview(mobileNumberTextField!)
            
            emailIdTextField = UITextField(frame: CGRectMake(10,150,self.view.frame.size.width - 20, 40))
            emailIdTextField!.layer.borderColor = UIColor.orangeColor().CGColor
            emailIdTextField!.layer.borderWidth = 1.0
            emailIdTextField!.placeholder = " Email Id"
//            emailIdTextField!.text = "anil@nimapinfotech.com"
            emailIdTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
            emailIdTextField!.layer.cornerRadius = 5.0
            containerScreen!.addSubview(emailIdTextField!)
            
            registerButton = UIButton(type: UIButtonType.Custom)
            registerButton!.frame = CGRectMake(10, 200, self.view.frame.size.width-20, 40)
            registerButton!.backgroundColor = UIColor.orangeColor()
            registerButton!.setTitle("REGISTER", forState: UIControlState.Normal)
            registerButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            registerButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
            registerButton!.layer.cornerRadius = 5.0
            registerButton!.addTarget(self, action:#selector(self.registerButtonClicked), forControlEvents: .TouchUpInside)
            containerScreen!.addSubview(registerButton!)
        }
    }
    
    func registerButtonClicked()
    {
        var title = ""
        if userNameTextField!.text!.isEmpty
        {
            title = "Username cannot be empty"
        }
        else if mobileNumberTextField!.text!.isEmpty
        {
            title = "Mobile number cannot be empty"
        }
        else if mobileNumberTextField!.text!.characters.count != 10
        {
            title = "Please enter a valid mobile number!!"
        }
        else if emailIdTextField!.text!.isEmpty
        {
            title = "Email ID cannot be empty"
        }
        else if !isEmail(emailIdTextField!.text!)
        {
            title = "Please provide a valid Email ID"
        }
        if title != ""
        {
            let alert = UIAlertView(title: "Amazon Calculator", message: title, delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else
        {
            let alert2 = UIAlertController(  title: "Amazon Calculator", message: "Are you sure you have entered valid email id and number to receive One Time Password(OTP)?", preferredStyle: .Alert)
            alert2.addAction(UIAlertAction(title: "PROCEED", style: .Default, handler: { (action) in self.callRegistrationParser()
            }))
            alert2.addAction(UIAlertAction(title: "CANCEL", style: .Cancel, handler: { (action) in
            }))
            presentViewController(alert2, animated: true, completion: nil)
        }
    }
    
    func callRegistrationParser()
    {
        print("Success")
        
        if registrationParser == nil
        {
            registrationParser = RegisterUserParser()
            registrationParser!.delegate = self
            registrationParser!.registerUser(name: userNameTextField!.text!, mobileno: mobileNumberTextField!.text!, emailid: emailIdTextField!.text!)
        }
        
        
    }
    
    func isEmail(string : String) -> Bool
    {
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive)
        return regex?.firstMatchInString(string, options: [], range: NSMakeRange(0, string.characters.count)) != nil
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
    }
    
    func didReceivedRegisterUserStatus(resultCode resultCode : Int)
    {
        registrationParser = nil
        if resultCode == AppConstant.Static.REGISTRATION_SUCCESS
        {
            let otpController = OTPViewController()
            self.navigationController!.pushViewController(otpController, animated: true)
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
    
    
    func didReceivedGetOTPStatus(resultCode resultCode : Int){
        
        
    }
    
    func didReceivedGetOTPStatus(resultCode resultCode : Int, otp : String?)
    {
        
    }
}
//
//  AFNView.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 21/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

protocol AFNViewDelegate : NSObjectProtocol
{
     func didReceivedAFNViewStatus(status status : Int, message : String?)
    func productReferralFeesTextFieldStatus(isError : Bool)
}


class AFNView: UIView, UITextFieldDelegate {
    
    var scrollView : UIScrollView?
    var productNameTextField : UITextField?
    var productBasePriceTextField : UITextField?
    var productShippingChargeTextField : UITextField?
    var productReferralFeesTextField : UITextField?
    var length :UITextField?
    var width : UITextField?
    var height : UITextField?
    var productWeightInGramsTextField : UITextField?
    var returnsRateTextField : UITextField?
    var vatRateTextField : UITextField?
    var totalCostTextField : UITextField?
    var calculateButton : UIButton?
    
    var delegate : AFNViewDelegate?
    
    let productNameStatus = 1
    let productBasePriceStatus = 2
    let productShippingChargeStatus = 3
    let productReferralFeesStatus = 4
    let lengthStatus = 5
    let widthStatus = 6
    let heightStatus = 7
    let productWeightInGramsStatus = 8
    let returnsRateStatus = 9
    let vatRateStatus = 10
    let totalCostStatus = 11
    let formSuccessStatus = 12
    
    let productNameMessage = "Product Name can not be empty."
    let productBasePriceMessage = "Product base price can not be empty."
    let productShippingChargeMessage = "Shipping charge can not be empty."
    let productReferralFeesMessage = "Product referral fees can not be empty."
    let lengthMessage = "Length can not be empty."
    let widthMessage = "Width can not be empty."
    let heightMessage = "Height can not be empty."
    let productWeightInGramsMessage = "Product weight can not be empty."
    let returnsRateMessage = "Returns rate can not be empty."
    let vatRateMessage = "Vat rate can not be empty."
    let totalCostMessage = "Total cost can not be empty."
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        loadScrollView()
        loadTextFields()
    }
    
    func loadScrollView()
    {
        scrollView = UIScrollView(frame : CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        scrollView!.backgroundColor = UIColor.whiteColor()
        self.addSubview(scrollView!)
    }
    func loadTextFields()
    {
        productNameTextField = UITextField(frame: CGRectMake(10,10,self.frame.size.width - 20, 35))
        productNameTextField!.layer.borderColor = UIColor.redColor().CGColor
        productNameTextField!.layer.borderWidth = 1.0
        productNameTextField!.becomeFirstResponder()
        productNameTextField!.placeholder = "Product Name"
        productNameTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        productNameTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productNameTextField!)
        
        productBasePriceTextField = UITextField(frame: CGRectMake(10,55,self.frame.size.width - 20, 35))
        productBasePriceTextField!.layer.borderColor = UIColor.redColor().CGColor
        productBasePriceTextField!.layer.borderWidth = 1.0
        productBasePriceTextField!.placeholder = "Product Base Price"
        productBasePriceTextField!.keyboardType = UIKeyboardType.PhonePad
        productBasePriceTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        productBasePriceTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productBasePriceTextField!)
        
        productShippingChargeTextField = UITextField(frame: CGRectMake(10,100,self.frame.size.width - 20, 35))
        productShippingChargeTextField!.layer.borderColor = UIColor.redColor().CGColor
        productShippingChargeTextField!.layer.borderWidth = 1.0
        productShippingChargeTextField!.placeholder = "Product Shipping Charge"
        productShippingChargeTextField!.keyboardType = UIKeyboardType.PhonePad
        productShippingChargeTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        productShippingChargeTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productShippingChargeTextField!)
        
        productReferralFeesTextField = UITextField(frame: CGRectMake(10,145,self.frame.size.width - 20, 35))
        productReferralFeesTextField!.layer.borderColor = UIColor.redColor().CGColor
        productReferralFeesTextField!.layer.borderWidth = 1.0
        productReferralFeesTextField!.placeholder = "Product Referral Fees"
        productReferralFeesTextField!.delegate = self
        productReferralFeesTextField!.keyboardType = UIKeyboardType.PhonePad
        productReferralFeesTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        productReferralFeesTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productReferralFeesTextField!)
        
//        amazonClosingFees = UITextField(frame: CGRectMake(10,190,self.frame.size.width - 20, 35))
//        amazonClosingFees!.layer.borderColor = UIColor.redColor().CGColor
//        amazonClosingFees!.layer.borderWidth = 1.0
//        amazonClosingFees!.placeholder = "Amazon closing fees"
//        amazonClosingFees!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
//        amazonClosingFees!.layer.cornerRadius = 5.0
//        scrollView!.addSubview(amazonClosingFees!)
//        
        length = UITextField(frame: CGRectMake(10,190,((self.frame.size.width/3)-10), 35))
        length!.layer.borderColor = UIColor.redColor().CGColor
        length!.layer.borderWidth = 1.0
        length!.placeholder = "Length cm"
        length!.keyboardType = UIKeyboardType.PhonePad
        length!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        length!.layer.cornerRadius = 5.0
        scrollView!.addSubview(length!)
        
        width = UITextField(frame: CGRectMake(((self.frame.size.width/3)+5) ,190,((self.frame.size.width/3)-10), 35))
        width!.layer.borderColor = UIColor.redColor().CGColor
        width!.layer.borderWidth = 1.0
        width!.placeholder = "Width cm"
        width!.keyboardType = UIKeyboardType.PhonePad
        width!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        width!.layer.cornerRadius = 5.0
        scrollView!.addSubview(width!)

        height = UITextField(frame: CGRectMake((2*(self.frame.size.width/3)),190,((self.frame.size.width/3)-10), 35))
        height!.layer.borderColor = UIColor.redColor().CGColor
        height!.layer.borderWidth = 1.0
        height!.placeholder = "Height cm"
        height!.keyboardType = UIKeyboardType.PhonePad
        height!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        height!.layer.cornerRadius = 5.0
        scrollView!.addSubview(height!)
        
        productWeightInGramsTextField = UITextField(frame: CGRectMake(10,235,self.frame.size.width - 20, 35))
        productWeightInGramsTextField!.layer.borderColor = UIColor.redColor().CGColor
        productWeightInGramsTextField!.layer.borderWidth = 1.0
        productWeightInGramsTextField!.placeholder = "Product Weight In Grams"
        productWeightInGramsTextField!.keyboardType = UIKeyboardType.PhonePad
        productWeightInGramsTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        productWeightInGramsTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(productWeightInGramsTextField!)
        
        returnsRateTextField = UITextField(frame: CGRectMake(10,280,self.frame.size.width - 20, 35))
        returnsRateTextField!.layer.borderColor = UIColor.redColor().CGColor
        returnsRateTextField!.layer.borderWidth = 1.0
        returnsRateTextField!.placeholder = "Returns Rate in %"
        returnsRateTextField!.keyboardType = UIKeyboardType.PhonePad
        returnsRateTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        returnsRateTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(returnsRateTextField!)
        
        vatRateTextField = UITextField(frame: CGRectMake(10,325,self.frame.size.width - 20, 35))
        vatRateTextField!.layer.borderColor = UIColor.redColor().CGColor
        vatRateTextField!.layer.borderWidth = 1.0
        vatRateTextField!.placeholder = "Vat Rate in %"
        vatRateTextField!.keyboardType = UIKeyboardType.PhonePad
        vatRateTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        vatRateTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(vatRateTextField!)
        
        totalCostTextField = UITextField(frame: CGRectMake(10,370,self.frame.size.width - 20, 35))
        totalCostTextField!.layer.borderColor = UIColor.redColor().CGColor
        totalCostTextField!.layer.borderWidth = 1.0
        totalCostTextField!.placeholder = "Total product cost + Packaging"
        totalCostTextField!.keyboardType = UIKeyboardType.PhonePad
        totalCostTextField!.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        totalCostTextField!.layer.cornerRadius = 5.0
        scrollView!.addSubview(totalCostTextField!)
        
        calculateButton = UIButton(type: UIButtonType.Custom)
        calculateButton!.frame = CGRectMake(10,415 /*460*/, self.frame.size.width-20, 35)
        calculateButton!.backgroundColor = UIColor.orangeColor()
        calculateButton!.setTitle("CALCULATE", forState: UIControlState.Normal)
        calculateButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        calculateButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
        calculateButton!.layer.cornerRadius = 5.0
        calculateButton!.addTarget(self, action:#selector(self.calculateButtonClicked), forControlEvents: .TouchUpInside)
        self.addSubview(calculateButton!)
               
    }
    
    func calculateButtonClicked()
    {
        print("Button clicked")
        var status = 0
        var message = ""
        
        if productNameTextField!.text!.isEmpty
        {
            status = productNameStatus
            message = productNameMessage
        }
        else if productBasePriceTextField!.text!.isEmpty
        {
            status = productBasePriceStatus
            message = productBasePriceMessage
        }
        else if productShippingChargeTextField!.text!.isEmpty
        {
            status = productShippingChargeStatus
            message = productShippingChargeMessage
        }
        else if productReferralFeesTextField!.text!.isEmpty
        {
            status = productReferralFeesStatus
            message = productReferralFeesMessage
        }
        else if length!.text!.isEmpty
        {
            status = lengthStatus
            message = lengthMessage
        }
        else if width!.text!.isEmpty
        {
            status = widthStatus
            message = widthMessage
        }
        else if height!.text!.isEmpty
        {
            status = heightStatus
            message = heightMessage
        }
        else if productWeightInGramsTextField!.text!.isEmpty
        {
            status = productWeightInGramsStatus
            message = productWeightInGramsMessage
        }
        else if returnsRateTextField!.text!.isEmpty
        {
            status = returnsRateStatus
            message = returnsRateMessage
        }
        else if vatRateTextField!.text!.isEmpty
        {
            status = vatRateStatus
            message = vatRateMessage
        }
        else if totalCostTextField!.text!.isEmpty
        {
            status = totalCostStatus
            message = totalCostMessage
        }
        else
        {
            status = formSuccessStatus
        }
        
        delegate!.didReceivedAFNViewStatus(status: status, message: message)
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == productReferralFeesTextField
        {
            if productBasePriceTextField!.text!.isEmpty
            {
                delegate!.productReferralFeesTextFieldStatus(true)
            }
            else
            {
                delegate!.productReferralFeesTextFieldStatus(false)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
}

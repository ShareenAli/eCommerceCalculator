//
//  ViewController.swift
//  AmazonCalculator
//
//  Created by Shareen Ali on 19/07/16.
//  Copyright © 2016 Shareen Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var splashImageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        loadImage()
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(openRegistrationScreen), userInfo: nil, repeats: false)
    }
    

    func openRegistrationScreen()
    {
        let registerController = RegistrationViewController()
        self.navigationController!.pushViewController(registerController, animated: true)
        
    }
    
//    func openMainCalculatorScreen()
//    {
//        let mainController = MainCalculatorViewController()
//        self.navigationController!.pushViewController(mainController, animated: true)
//        
//    }
//    
    
    func loadImage()
    {
        if splashImageView == nil {
            splashImageView = UIImageView(image : UIImage(named: "splashscreen@ip6"))
            splashImageView?.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
            splashImageView?.contentMode = .ScaleAspectFit
            self.view.addSubview(splashImageView!)
            
            let ac = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            ac.center = CGPoint(x: UIScreen.mainScreen().bounds.width/2, y: UIScreen.mainScreen().bounds.height/2)
            ac.startAnimating()
            view.addSubview(ac)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

/* var AFNButton : UIButton?
var MFNButton : UIButton?
var calcButton : UIButton?
var afnView : AFNView?
var mfnView : MFNView?
var lineView : UIView?
var lineView2 : UIView? */
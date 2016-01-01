//
//  SettingsViewController.swift
//  tips
//
//  Created by Alice Yang on 12/31/15.
//  Copyright (c) 2015 Alice Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        if let iTipPercentage = find(tipPercentages, tipValue) {
            defaultTipControl.selectedSegmentIndex = iTipPercentage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDefaultTipChange(sender: AnyObject) {
        var tipPercentage = tipPercentages[defaultTipControl.selectedSegmentIndex]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentage, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

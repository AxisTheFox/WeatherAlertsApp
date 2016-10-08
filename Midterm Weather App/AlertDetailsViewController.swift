//
//  AlertDetailsViewController.swift
//  Midterm Weather App
//
//  Created by Braydon Fox on 10/7/16.
//  Copyright © 2016 Braydon Fox. All rights reserved.
//

import UIKit

class AlertDetailsViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var effectiveLabel: UILabel!
    @IBOutlet weak var expiresLabel: UILabel!
    @IBOutlet weak var urgencyLabel: UILabel!
    @IBOutlet weak var severityLabel: UILabel!
    @IBOutlet weak var certaintyLabel: UILabel!
    
    var stateName = ""
    var alertURL = ""
    var eventId = ""
    var eventSummary = ""
    var eventName = ""
    var effective = ""
    var expires = ""
    var urgency = ""
    var certainty = ""
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = eventName
        summaryTextView.isScrollEnabled = true
        summaryTextView.allowsEditingTextAttributes = false
        summaryTextView.text = eventSummary
        effectiveLabel.text = effective
        expiresLabel.text = expires
        certaintyLabel.text = certainty
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

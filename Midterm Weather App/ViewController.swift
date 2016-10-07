//
//  ViewController.swift
//  Midterm Weather App
//
//  Created by Braydon Fox on 10/7/16.
//  Copyright © 2016 Braydon Fox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var statePickerView: UIPickerView!
    @IBOutlet weak var selectStateButton: UIButton!
    
    var selectedState = ""
    var selectedStateAbbreviation = ""
    let states: [(stateName:String, stateAbbreviation:String)] =
        [("ALABAMA","al"),
         ("ALASKA","ak"),
         ("ARIZONA","az"),
         ("ARKANSAS","ar"),
         ("CALIFORNIA","ca"),
         ("COLORADO","co"),
         ("CONNECTICUT","ct"),
         ("DELAWARE","de"),
         ("FLORIDA","fl"),
         ("GEORGIA","ga"),
         ("HAWAII","hi"),
         ("IDAHO","id"),
         ("ILLINOIS","il"),
         ("INDIANA","in"),
         ("IOWA","ia"),
         ("KANSAS","ks"),
         ("KENTUCKY","ky"),
         ("LOUISIANA","la"),
         ("MAINE","me"),
         ("MARYLAND","md"),
         ("MASSACHUSETTS","ma"),
         ("MICHIGAN","mi"),
         ("MINNESOTA","mn"),
         ("MISSISSIPPI","ms"),
         ("MISSOURI","mo"),
         ("MONTANA","mt"),
         ("NEBRASKA","ne"),
         ("NEVADA","nv"),
         ("NEW HAMPSHIRE","nh"),
         ("NEW JERSEY","nj"),
         ("NEW MEXICO","nm"),
         ("NEW YORK","ny"),
         ("NORTH CAROLINA","nc"),
         ("NORTH DAKOTA","nd"),
         ("OHIO","oh"),
         ("OKLAHOMA","ok"),
         ("OREGON","or"),
         ("PENNSYLVANIA","pa"),
         ("RHODE ISLAND","ri"),
         ("SOUTH CAROLINA","sc"),
         ("SOUTH DAKOTA","sd"),
         ("TENNESSEE","tn"),
         ("TEXAS","tx"),
         ("UTAH","ut"),
         ("VERMONT","vt"),
         ("VIRGINIA","va"),
         ("WASHINGTON","wa"),
         ("WEST VIRGINIA","wv"),
         ("WISCONSIN","wi"),
         ("WYOMING","wy")]

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select State"
        statePickerView.delegate = self
        statePickerView.dataSource = self
        selectedStateAbbreviation = "al"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Delegates and Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row].stateName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedStateAbbreviation = states[row].stateAbbreviation
        selectedState = states[row].stateName
    }
    
    // MARK: Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? AlertsTableViewController
        destination?.stateName = selectedState
        destination?.stateAbbreviation = selectedStateAbbreviation
        navigationItem.title = nil
    }


}


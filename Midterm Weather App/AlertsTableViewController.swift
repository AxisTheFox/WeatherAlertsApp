//
//  AlertsTableViewController.swift
//  Midterm Weather App
//
//  Created by Braydon Fox on 10/7/16.
//  Copyright © 2016 Braydon Fox. All rights reserved.
//

import UIKit

class AlertsTableViewController: UITableViewController, XMLParserDelegate {
    
    // MARK: Properties
    var stateName = String()
    var stateAbbreviation = String()
    var alertsURLString = String()
    var foundEntry:Bool = false
    var foundId:Bool = false
    var foundEvent:Bool = false
    var foundEffective:Bool = false
    var foundExpires:Bool = false
    var foundSeverity:Bool = false

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = stateName + " ALERTS"
        alertsURLString = "http://alerts.weather.gov/cap/" + stateAbbreviation + ".php?x=0"
        let alertsURL = URL(string:alertsURLString)
        let xmlParser = XMLParser(contentsOf: alertsURL!)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // MARK: XML Parsing
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if (elementName == "entry") {
            foundEntry = true
        } else if (elementName == "id") {
            foundId = true
        } else if (elementName == "cap:event") {
            foundEvent = true
        } else if (elementName == "cap:effective") {
            foundEffective = true
        } else if (elementName == "cap:expires") {
            foundExpires = true
        } else if (elementName == "cap:severity") {
            foundSeverity = true
        }
    }
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName == "entry") {
            foundEntry = false
        }
        if (elementName == "id") {
            foundId = false
        }
        if (elementName == "cap:event") {
            foundEvent = false
        }
        if (elementName == "cap:effective") {
            foundEffective = false
        }
        if (elementName == "cap:expires") {
            foundExpires = false
        }
        if (elementName == "cap:severity") {
            foundSeverity = false
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if (foundEntry && foundId) {
            
        }
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

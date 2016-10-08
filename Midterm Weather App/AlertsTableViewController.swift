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
    var foundSummary:Bool = false
    var foundEvent:Bool = false
    var foundEffective:Bool = false
    var foundExpires:Bool = false
    var foundCertainty:Bool = false
    var foundSeverity:Bool = false
    
    var idsArray:[String] = []
    var summariesArray:[String] = []
    var eventsArray:[String] = []
    var effectivesArray:[String] = []
    var expiresArray:[String] = []
    var certaintyArray:[String] = []
    var severitiesArray:[String] = []

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

    // MARK: Table View Delegate and Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = eventsArray[(indexPath as NSIndexPath).row]
        cell.detailTextLabel?.textColor = UIColor.darkGray
        cell.detailTextLabel?.text = "Expires: " + expiresArray[(indexPath as NSIndexPath).row]
        if (severitiesArray[(indexPath as NSIndexPath).row] == "Extreme") {
            cell.backgroundColor = UIColor.red
        } else if (severitiesArray[(indexPath as NSIndexPath).row] == "Severe") {
            cell.backgroundColor = UIColor.orange
        } else if (severitiesArray[(indexPath as NSIndexPath).row] == "Moderate") {
            cell.backgroundColor = UIColor.yellow
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showAlertDetails", sender: indexPath)
    }
    
    // MARK: XML Parsing
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if (elementName == "entry") {
            foundEntry = true
        }
        if (elementName == "id") {
            foundId = true
        }
        if (elementName == "summary") {
            foundSummary = true
        }
        if (elementName == "cap:event") {
            foundEvent = true
        }
        if (elementName == "cap:effective") {
            foundEffective = true
        }
        if (elementName == "cap:expires") {
            foundExpires = true
        }
        if (elementName == "cap:certainty") {
            foundCertainty = true
        }
        if (elementName == "cap:severity") {
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
        if (elementName == "summary") {
            foundSummary = false
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
        if (elementName == "cap:certainty") {
            foundCertainty = false
        }
        if (elementName == "cap:severity") {
            foundSeverity = false
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if (foundEntry && foundId) {
            idsArray.append(string)
        }
        if (foundEntry && foundSummary) {
            summariesArray.append(string)
        }
        if (foundEntry && foundEvent) {
            eventsArray.append(string)
        }
        if (foundEntry && foundEffective) {
            effectivesArray.append(string)
        }
        if (foundEntry && foundExpires) {
            expiresArray.append(string)
        }
        if (foundEntry && foundCertainty) {
            certaintyArray.append(string)
        }
        if (foundEntry && foundSeverity) {
            severitiesArray.append(string)
        }
    }
    
    // MARK: Segue to Alert Details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? AlertDetailsViewController
        let index = ((sender as! IndexPath) as NSIndexPath).row
        destination?.stateName = stateName
        destination?.alertURL = alertsURLString
        destination?.eventId = idsArray[index]
        destination?.eventSummary = summariesArray[index]
        destination?.eventName = eventsArray[index]
        destination?.effective = effectivesArray[index]
        destination?.certainty = certaintyArray[index]
        destination?.expires = expiresArray[index]
        navigationItem.title = nil
    }

}

//
//  ViewController.swift
//  ExpandableTabelview
//
//  Created by Naveed Ahmad on 02/09/2018.
//  Copyright © 2018 Naveed Ahmad. All rights reserved.
//

import UIKit

struct CellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String()]
}

class TableViewController: UITableViewController {
    
    var tableViewData = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableViewData = [
            CellData(opened: false, title: "Title 1", sectionData: ["Cell 1","Cell 2","Cell 3"]),
            CellData(opened: false, title: "Title 2", sectionData: ["Cell 1","Cell 2","Cell 3","Cell 1","Cell 2","Cell 3"]),
            CellData(opened: false, title: "Title 3", sectionData: ["Cell 1","Cell 2","Cell 3"])]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell

        if indexPath.row == 0 {
            cell.textLabel?.text = tableViewData[indexPath.section].title
        }else{
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }else{
         tableViewData[indexPath.section].opened = true
            let sections = IndexSet(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }

}


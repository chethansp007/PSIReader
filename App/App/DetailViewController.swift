//
//  DetailViewController.swift
//  App
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import UIKit
import Data

class DetailViewController: UITableViewController {
    
    var items : [Items]?
    var headerString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
}

extension DetailViewController {
    
    override func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        return headerString
    }
    
    override func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return self.items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailViewCell
        
        if let items = self.items {
            let item = items[indexPath.row]
            cell.titleLabel.text = item.type
            cell.valueLabel.text = "\(item.value)"
        }
        return cell
    }
}

//
//  MenuTableViewController.swift
//  SideMenu
//
//  Created by 김진형 on 2018. 7. 13..
//  Copyright © 2018년 김진형. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    let titles = ["asdf", "asqwer", "asdfq", "1231"]
    override func viewDidLoad() {
        super.viewDidLoad()

        let emailLabel = UILabel()
        emailLabel.text = "adsfasdfa@nasdfqwer.com"
        emailLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        emailLabel.textColor = UIColor.white
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        headerView.backgroundColor = UIColor.darkGray
        headerView.addSubview(emailLabel)

        
        tableView.tableHeaderView = headerView
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "menuCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) 

        cell.textLabel?.text = titles[indexPath.row]
        
        return cell
    }
 

}

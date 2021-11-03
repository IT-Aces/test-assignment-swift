//
//  ViewController.swift
//  TA1Swift
//
//  Created by Ivan Manov on 29.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [SampleMessage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = []
        
        self.tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        let sampleDataSource = SampleDataSource()
        sampleDataSource.loadMessages { (messages) in
            if !messages.isEmpty {
                self.dataSource = messages
                self.tableView.reloadData()
            }
        }
    }


}


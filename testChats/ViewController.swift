//
//  ViewController.swift
//  testChats
//
//  Created by Aigerim Kenesbek on 15/02/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var chatsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.font = UIFont(name: "Gilroy-Bold", size: 30) ?? UIFont.systemFont(ofSize: 30, weight: .semibold)

        label.textColor = UIColor.black
        label.text = "Чаты"
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var searchBar: UISearchBar = {
         let searchBar = UISearchBar()
         searchBar.placeholder = "Поиск"
         searchBar.backgroundImage = UIImage()
         //searchBar.delegate = self
         return searchBar
     }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
       // tableView.dataSource = self
       // tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        view.addSubview(chatsLabel)
        view.addSubview(searchBar)

        
    }


}


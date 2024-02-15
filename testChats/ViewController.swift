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
       // tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        view.addSubview(chatsLabel)
        view.addSubview(searchBar)

        setUpConstraints()
    }


    private func setUpConstraints() {
        
        chatsLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(chatsLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseIdentifier, for: indexPath) as! MyTableViewCell
        return cell
    }
}


//MARK: -- Ячейки

class MyTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MyTableViewCell"
    
    public lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = self.frame.height/1.5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public lazy var label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    public lazy var label2: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        return label
    }()
    
    public lazy var label3: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.alpha = 0.5
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        contentView.addSubview(myImageView)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
    }
    

    private func setUpConstraints() {
        myImageView.snp.makeConstraints { make in
            make.size.equalTo(60)

            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-30)
            make.right.equalTo(label2.snp.left).offset(-16)
    }

        label1.snp.makeConstraints { make in
    make.left.equalTo(myImageView.snp.right).offset(16)
    make.right.equalTo(label3.snp.left).inset(-10) //RIGHT
    make.bottom.equalTo(label2.snp.top).inset(-8) //BOTTOM
    make.top.equalTo(myImageView.snp.top)
    }

        label2.snp.makeConstraints { make in
    make.left.equalTo(label1.snp.left)
    make.right.equalToSuperview().offset(-24)
    }

        label3.snp.makeConstraints { make in
    make.right.equalToSuperview().offset(-16)
    make.top.equalToSuperview().offset(20)
    }
  }
}

//
//  ViewController.swift
//  testChats
//
//  Created by Aigerim Kenesbek on 15/02/2024.
//

import UIKit
import SnapKit

    struct ChatMessage {
        let user: String
        let text: String
        let sender: String
        let time: String
        let timeHM: String
        let deliveredStatus: Bool
        let image: UIImage?
    }

class ViewController: UIViewController {
        
    let chats: [ChatMessage] = [
            ChatMessage(user: "Я", text: "Какие горы", sender: "me", time: "26.01.22", timeHM: "09:41", deliveredStatus: true, image: UIImage(named: "Gora")),
            ChatMessage(user: "Я", text: "Сделай мне кофе, пожалуйста", sender: "me", time: "27.01.22", timeHM: "21:41", deliveredStatus: true, image: nil),
            ChatMessage(user: "Виктор Власов", text: "Хорошо", sender: "you", time: "27.01.22", timeHM: "21:41", deliveredStatus: true, image: UIImage(named: "Gora")),
            ChatMessage(user: "Виктор Власов", text: "Хорошо", sender: "you", time: "27.01.22", timeHM: "21:41", deliveredStatus: true, image: nil),
            ChatMessage(user: "Я", text: "Уже сделал?", sender: "me", time: "Сегодня", timeHM: "09:41", deliveredStatus: false, image: nil),
            ChatMessage(user: "Я", text: "Мне просто срочно нужен", sender: "me", time: "Сегодня", timeHM: "09:41", deliveredStatus: false, image: nil),
            ChatMessage(user: "Я", text: "Напиши когда будешь готов", sender: "me", time: "12-01-22", timeHM: "08:41", deliveredStatus: true, image: nil),
            ChatMessage(user: "Саша Алексеев", text: "Я готов", sender: "you", time: "Сегодня", timeHM: "09:01", deliveredStatus: true, image: nil),
            ChatMessage(user: "Петр Жаринов", text: "Где ты?", sender: "you", time: "Сегодня", timeHM: "09:11", deliveredStatus: true, image: nil),
            ChatMessage(user: "Я", text: "Я вышел", sender: "me", time: "Сегодня", timeHM: "09:11", deliveredStatus: false, image: nil),
            ChatMessage(user: "Алина Жукова", text: "Выходите?", sender: "you", time: "Сегодня", timeHM: "09:01", deliveredStatus: true, image: nil),
            ChatMessage(user: "Я", text: "Я вышел", sender: "me", time: "Сегодня", timeHM: "09:11", deliveredStatus: true, image: nil)
      ]

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
         return searchBar
     }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseIdentifier)
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
        
        switch indexPath.row {
        case 0:
            cell.label1.text = "Виктор Власов"
            cell.label2.text = "Вы: Уже сделал?"
            cell.label3.text = "Вчера"
            cell.myImageView.image = UIImage(named: "ВВ")
        case 1:
            cell.label1.text = "Саша Алексеев"
            cell.label2.text = "Я готов"
            cell.label3.text = "12.01.22"
            cell.myImageView.image = UIImage(named: "СА")
        case 2:
            cell.label1.text = "Петр Жаринов"
            cell.label2.text = "Вы: Я вышел"
            cell.label3.text = "2 минуты назад"
            cell.myImageView.image = UIImage(named: "ПЖ")
        case 3:
            cell.label1.text = "Алина Жукова"
            cell.label2.text = "Вы: Я вышел"
            cell.label3.text = "09:23"
            cell.myImageView.image = UIImage(named: "АЖ")
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name: String
            switch indexPath.row {
            case 0:
                name = "Виктор Власов"
            case 1:
                name = "Саша Алексеев"
            case 2:
                name = "Петр Жаринов"
            case 3:
                name = "Алина Жукова"
            default:
                name = ""
            }
             
        var selectedChatMessages: [ChatMessage] = []
            tableView.deselectRow(at: indexPath, animated: true)
   
        switch indexPath.row {
        case 0:
            selectedChatMessages = Array(chats[0..<5])
        case 1:
            selectedChatMessages = [chats[6], chats[7]]
        case 2:
            selectedChatMessages = [chats[8], chats[9]]
        case 3:
            selectedChatMessages = [chats[10], chats[11]]
        default:
            break
        }
        
        let secondVC = SecondViewController(name: name, image: chats[indexPath.row].image, messages: selectedChatMessages)

        if let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell {
                secondVC.selectedMessage = cell.label2.text
                secondVC.selectedImage = cell.myImageView.image
            }
        
        navigationController?.pushViewController(secondVC, animated: true)
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
        label.font = UIFont(name: "Inter-Regular", size: 10)
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
            make.top.equalToSuperview().offset(17)
            make.bottom.equalToSuperview().offset(-17)
            make.right.equalTo(label2.snp.left).offset(-16)
    }

        label1.snp.makeConstraints { make in
    make.left.equalTo(myImageView.snp.right).offset(16)
    make.right.equalTo(label3.snp.left).inset(-10)
    make.bottom.equalTo(label2.snp.top).inset(-8)
    make.top.equalTo(myImageView.snp.top)
    }

        label2.snp.makeConstraints { make in
    make.left.equalTo(label1.snp.left)
    make.right.equalToSuperview().offset(-24)
    }

        label3.snp.makeConstraints { make in
    make.centerY.equalTo(label1.snp.centerY)
    make.right.equalToSuperview().offset(-16)
    }
  }
}

//MARK: -- UISearchBarDelegate - для поиска из SearchBar
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tableView.reloadData()
        } else {
            for section in 0..<tableView.numberOfSections {
                for row in 0..<tableView.numberOfRows(inSection: section) {
                    let indexPath = IndexPath(row: row, section: section)
                    if let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell {
                        
                        cell.isHidden = !(cell.label1.text?.localizedCaseInsensitiveContains(searchText) ?? false)
                    }
                }
            }
        }
    }
}


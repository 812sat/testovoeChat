//
//  SecondViewController.swift
//  testChats
//
//  Created by Aigerim Kenesbek on 15/02/2024.
//
import UIKit
import Foundation
import SnapKit

class SecondViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let textField = UITextField()
    
    var nameLabel: UILabel = UILabel()
    var selectedImage: UIImage?
    var selectedName: String?
    
    let statuses = ["В сети", "Офлайн", "Офлайн", "В сети"]
    var currentStatusIndex = 0
    
    private let messages: [ChatMessage]
    
    init(name: String, image: UIImage?, messages: [ChatMessage]) {
        self.selectedName = name
        self.selectedImage = image
        self.messages = messages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.addArrangedSubview(textField)
        
        //MARK: -- Верхний отдел
               
        let imageView = UIImageView(image: selectedImage)
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 44 / 2
        imageView.clipsToBounds = true
               
        let nameLabel = UILabel()
        nameLabel.layer.cornerRadius = 8
        nameLabel.layer.masksToBounds = true
        nameLabel.text = selectedName
               
        let statusLabel = UILabel()
        statusLabel.layer.cornerRadius = 8
        statusLabel.layer.masksToBounds = true
        statusLabel.font = UIFont(name: "Inter-Regular", size: 10)
        statusLabel.alpha = 0.5
        statusLabel.text = statuses[currentStatusIndex]
               
               let messageText = UITextField()
               messageText.borderStyle = .roundedRect
               
               let customView = UIView()
               customView.addSubview(imageView)
               customView.addSubview(nameLabel)
               customView.addSubview(statusLabel)
               
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(customView)
            make.trailing.equalTo(customView).offset(-280)
            make.width.height.equalTo(44)
                }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top)
            make.leading.equalTo(imageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
                }
                
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(1)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(20)
                }
        
        
        //MARK: -- ЧАТЫ
        for message in messages {
            let messageLabel = UILabel()
            messageLabel.text = message.text
            messageLabel.font = UIFont.systemFont(ofSize: 16)
            messageLabel.numberOfLines = 0
            messageLabel.lineBreakMode = .byWordWrapping
            messageLabel.layer.cornerRadius = 12
            messageLabel.clipsToBounds = true
            messageLabel.textAlignment = .left
            messageLabel.backgroundColor = UIColor.myGreen

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = 10
            paragraphStyle.headIndent = 10
            let attributedText = NSMutableAttributedString(string: message.text)
            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
            messageLabel.attributedText = attributedText
            stackView.addArrangedSubview(messageLabel)

            messageLabel.snp.makeConstraints { make in
                if message.sender == "me" {
                    make.leading.equalToSuperview().offset(80)
                    make.trailing.equalToSuperview().offset(-10)
                } else {
                    make.leading.lessThanOrEqualToSuperview().inset(10)
                    make.trailing.equalToSuperview().offset(-80)
                }
                make.width.lessThanOrEqualToSuperview().offset(-90)
                make.height.greaterThanOrEqualTo(36)
            }
            
            // --- Иконки и статус доставки ---
            let timeLabel = UILabel()
            timeLabel.text = message.timeHM
            timeLabel.font = UIFont.systemFont(ofSize: 12)
            timeLabel.textAlignment = .right
            timeLabel.alpha = 0.5

            let deliveredIcon = UIImageView()
            deliveredIcon.contentMode = .scaleAspectFit
            if message.deliveredStatus {
                deliveredIcon.image = UIImage(named: "delivered_icon")
            } else {
                deliveredIcon.image = UIImage(named: "undelivered_icon")
            }

            messageLabel.addSubview(timeLabel)
            messageLabel.addSubview(deliveredIcon)

            timeLabel.snp.makeConstraints { make in
                make.trailing.equalTo(deliveredIcon.snp.leading)
                make.bottom.equalToSuperview()
            }
            deliveredIcon.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.centerY.equalTo(timeLabel)
            }
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        
        //MARK: -- Нижний отдел
               
               let separatorView = UIView()
               separatorView.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.3)
               view.addSubview(separatorView)

               let messageTextfield = UITextField()
               messageTextfield.placeholder = "Сообщение"
               messageTextfield.borderStyle = .roundedRect
               messageTextfield.backgroundColor = .systemGray6
               messageTextfield.layer.cornerRadius = 10
               view.addSubview(messageTextfield)
               
               let paperclipIcon = UIImage(systemName: "paperclip")
               let micIcon = UIImage(systemName: "mic")
               let paperclipImageView = UIImageView(image: paperclipIcon)
               let micImageView = UIImageView(image: micIcon)
               view.addSubview(paperclipImageView)
               view.addSubview(micImageView)
               
               separatorView.snp.makeConstraints { make in
                   make.top.equalTo(messageTextfield.snp.top).offset(-10)
                   make.left.right.equalToSuperview()
                   make.height.equalTo(0.5)
               }
                   
               messageTextfield.snp.makeConstraints { make in
                   make.bottom.equalToSuperview().offset(-40)
                   make.left.equalTo(paperclipImageView.snp.right).offset(8)
                   make.right.equalTo(micImageView.snp.left).offset(-8)
                   make.height.equalTo(36)
                   make.width.equalTo(100)
               }
                       
               paperclipImageView.snp.makeConstraints { make in
                   make.centerY.equalTo(messageTextfield.snp.centerY)
                   make.left.equalToSuperview().offset(20)
                   make.width.height.equalTo(26)
               }
               micImageView.snp.makeConstraints { make in
                   make.centerY.equalTo(messageTextfield.snp.centerY)
                   make.right.equalToSuperview().offset(-20)
                   make.width.height.equalTo(26)
               }
        
        func updateStatus() {
                currentStatusIndex = (currentStatusIndex + 1) % statuses.count
                statusLabel.text = statuses[currentStatusIndex]
            }
       
        
        let customBarButtonItem = UIBarButtonItem(customView: customView)

        navigationItem.rightBarButtonItem = customBarButtonItem
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
}

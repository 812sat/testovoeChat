//
//  SecondViewController.swift
//  testChats
//
//  Created by W1! on 15/02/2024.
//

import UIKit
import Foundation
import SnapKit

class SecondViewController: UIViewController {
    
    var selectedImage: UIImage?
    var selectedName: String?
    
    let statuses = ["В сети", "Офлайн", "Офлайн", "В сети"]
    var currentStatusIndex = 0
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white

        
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
                   make.height.equalTo(40)
                   make.width.equalTo(100)
               }
                       
               paperclipImageView.snp.makeConstraints { make in
                   make.centerY.equalTo(messageTextfield.snp.centerY)
                   make.left.equalToSuperview().offset(20)
                   make.width.height.equalTo(30)
               }
               micImageView.snp.makeConstraints { make in
                   make.centerY.equalTo(messageTextfield.snp.centerY)
                   make.right.equalToSuperview().offset(-20)
                   make.width.height.equalTo(30)
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

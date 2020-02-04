//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/29/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, MessageReload {
    
    // OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // VARIABLES
    var messageArray = [Message]()
    
    // LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instace.getAllFeedMessage { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray.reversed()
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // FUNC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreatePostVC" {
            guard let createPostVC = segue.destination as? CreatePostVC else { return }
            createPostVC.delegate = self
        }
    }
    func updateMessage() {
        DataService.instace.getAllFeedMessage { (returnMessageArray) in
            self.messageArray = returnMessageArray.reversed()
            self.tableView.reloadData()
        }
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else { return UITableViewCell() }
        let message = messageArray[indexPath.row]
        let image = UIImage(named: "defaultProfileImage")
        
        DataService.instace.getUsername(forUID: message.senderId) { (returnUsername) in
            cell.configureCell(profileImage: image!, email: returnUsername, content: message.content)
        }
        return cell
    }
}


//
//  GroupFeedVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/7/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    
    //MARK: VARIABLES
    var groupMessage = [Message]()
    
    //MARK: LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.bindToKeyboard()
        sendBtn.bindToKeyboard()
        sendBtn.isEnabled = true
        messageTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instace.getEmails(forGroups: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        
        DataService.instace.REF_GROUPS.observe(.value) { (snapShot) in
            DataService.instace.getAllMessage(forDesiredGroup: self.group!) { (returnedGroupMessage) in
                self.groupMessage = returnedGroupMessage
                self.tableView.reloadData()
                self.scrollToLast()                
            }
        }
    }
    
    //MARK: @IBACTIONS
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if messageTextField.text != "" {
            self.messageTextField.isHidden = false
            self.sendBtn.isEnabled = false
            DataService.instace.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key) { (success) in
                if success {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                    self.scrollToLast()
                }
            }
        }
    }
    
    //MARK: VARIABLES
    var group: Group?
    
    
    //MARK: FUNC
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    func scrollToLast() {
        let lastCell = groupMessage.count  - 1
        let endIndex = IndexPath(row: lastCell, section: 0)
        if self.groupMessage.count > 0 {
            self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
        }
    }

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessage.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else { return UITableViewCell() }
        let message = groupMessage[indexPath.row]
        DataService.instace.getUsername(forUID: message.senderId) { (returnedEmail) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: returnedEmail, content: message.content)
        }
        return cell
    }
}

extension GroupFeedVC: UITextFieldDelegate { }




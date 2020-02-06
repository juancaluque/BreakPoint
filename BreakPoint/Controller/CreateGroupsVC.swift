//
//  CreateGroupsVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/4/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var addPplLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // VARIABLES
    var emailArray = [String]()
    var chosenUserArray = [String]()
    
    // LIFECYCLE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    // @IBACTIONS
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instace.getIds(forUsernames: chosenUserArray) { (idArray) in
                var usersArray = idArray
                usersArray.append((Auth.auth().currentUser?.uid)!)
                DataService.instace.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, ids: usersArray) { (success) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                        print("GROUP CREATE SUCCESS")
                    } else {
                        debugPrint("COULD NOT CREATE GROUP: \(String(describing: Error?.self))")
                    }
                }
            }
        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // FUNC
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataService.instace.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        let email = emailArray[indexPath.row]
        
        if chosenUserArray.contains(email) {
            cell.configureCell(profileImage: profileImage!, email: email, isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: email, isSelected: false)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenUserArray.contains(cell.emailLbl.text!) {
            chosenUserArray.append(cell.emailLbl.text!)
            addPplLbl.text = chosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            chosenUserArray = chosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if chosenUserArray.count >= 1 {
                addPplLbl.text = chosenUserArray.joined(separator: ", ")
            } else {
                addPplLbl.text = "add people to you group:"
                doneBtn.isHidden = true
            }
        }
    }
}

extension CreateGroupsVC: UITextFieldDelegate {
    
}

//
//  MeVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 2/1/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    
    // OUTLETS
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        emailLbl.text = Auth.auth().currentUser?.email
    }
    
    // @IBOUTLETS
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (button) in
            do {
                try Auth.auth().signOut()
                guard let authVC = self.storyboard?.instantiateViewController(identifier: "AuthVC") as? AuthVC else { return }
                self.present(authVC, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    } 
}

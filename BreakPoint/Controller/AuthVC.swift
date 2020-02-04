//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/30/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {
   
    // LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        print(String(describing: Auth.auth().currentUser?.email))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if Auth.auth().currentUser != nil{
            dismiss(animated: true, completion: nil)
        }
    }
        

    // @IBACTIONS
    @IBAction func emailBtnWasPressed(_ sender: Any) {
    }
    @IBAction func facebookBtnWasPressed(_ sender: Any) {
    }
    @IBAction func googleBtnWasPressed(_ sender: Any) {
    }
}

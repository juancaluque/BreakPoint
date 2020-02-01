//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/30/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // @IBACTIONS
    @IBAction func emailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        present(loginVC, animated: true, completion: nil)
    }
    @IBAction func facebookBtnWasPressed(_ sender: Any) {
    }
    @IBAction func googleBtnWasPressed(_ sender: Any) {
    }
}

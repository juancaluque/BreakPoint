//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/30/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // @IBACTIONS
    @IBAction func signinBtnWasPressed(_ sender: Any) {
        
        AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, loginError) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Could not login: \(String(describing: loginError?.localizedDescription))")
            }
            AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, registrationError) in
                if success {
                    AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, nil) in
                        print("Successfully registered user")
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    print("Could not register: \(String(describing: registrationError?.localizedDescription))")
                }
            }
        }
        
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension LoginVC: UITextFieldDelegate{
    
}

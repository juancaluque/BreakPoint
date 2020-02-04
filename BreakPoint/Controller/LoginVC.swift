//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/30/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    // LFIECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // VARIABLES
    
    // @IBACTIONS
    @IBAction func signinBtnWasPressed(_ sender: Any) {
        AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, error) in
            if success {
                print("LOGIN 1 SUCCESS")
                self.dismiss(animated: true, completion: nil)
            } else {
                debugPrint("COULD NOT LOGIN 1: \(String(describing: error?.localizedDescription))")
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, error) in
                    if success {
                        print("REGISTER SUCCESS")
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, error) in
                            if success {
                                print("LOGIN 2 SUCCESS")
                                self.dismiss(animated: true, completion: nil)
                            } else {
                                debugPrint("COULD NOT LOGIN 2: \(String(describing: error?.localizedDescription))")
                            }
                        }
                    } else {
                        debugPrint("COULD NOT REGISTER: \(String(describing: error?.localizedDescription))")
                    }
                }
            }
        }
//        AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (success, loginError) in
//            if success {
//                self.dismiss(animated: true, completion: nil)
//                return
//            } else {
//                print("COULD NOT LOGIN: \(String(describing: loginError?.localizedDescription))")
//            }
//
//            AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, registrationError) in
//                if success {
//                    AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (success, nil) in
//                        print("Successfully registered user")
//                        self.dismiss(animated: true, completion: nil)
//                    }
//                } else {
//                    print("COULD NOT REGISTER: \(String(describing: registrationError?.localizedDescription))")
//                }
//            }
//        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate{
    
}

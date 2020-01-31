//
//  AuthService.swift
//  BreakPoint
//
//  Created by Juan Luque on 1/31/20.
//  Copyright © 2020 Juan Luque. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, createUserCompletion: @ escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                createUserCompletion(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email!] as [String : Any]
            DataService.instace.createDBUser(uid: user.uid, userData: userData)
            createUserCompletion(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginUserCompletion: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                loginUserCompletion(false, error)
                return
            }
            
            loginUserCompletion(true , nil)
            
        }
    }
    
}

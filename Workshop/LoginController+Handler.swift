//
//  LoginController+Handler.swift
//  Workshop
//
//  Created by Chandan Brown on 10/11/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import Foundation
import Firebase
import UIKit

extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    
    func handleLogin() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            //successfully logged in our user
            
            self.workshopsController.fetchUserAndSetupNavBarTitle()
            
            self.dismiss(animated: true, completion: nil)
            
        })
        
    }


func handleRegister() {
    guard let email = emailTextField.text, let password = passwordTextField.text else {
        print("Form is not valid")
        return
    }
    
    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
        
        if error != nil {
            print(error)
            return
        }
        
        guard (user?.uid) != nil else {
            return
        }
        
        //successfully authenticated user    
        
    })
}

fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
    let ref = FIRDatabase.database().reference()
    let usersReference = ref.child("users").child(uid)
    
    usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
        
        if err != nil {
            print(err)
            return
        }
        
        self.workshopsController.fetchUserAndSetupNavBarTitle()
        
        self.dismiss(animated: true, completion: nil)
    })
}


}

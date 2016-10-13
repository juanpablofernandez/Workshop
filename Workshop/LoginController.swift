//
//  LoginController.swift
//  Workshop
//
//  Created by Chandan Brown on 10/1/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginController: UIViewController, GIDSignInUIDelegate {
    
    func checkIfUserIsLoggedIn() {
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            self.workshopsController.fetchUserAndSetupNavBarTitle()
        }
    }
    
    func handleLogout() {
        
        do {
            
            try! FIRAuth.auth()!.signOut()
            
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

    
    let workshopsController = WorkshopsViewController()
    
    // @IBOutlet weak var signInButton: GIDSignInButton!
    //
    var googleRegisterButton: GIDSignInButton! = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //
        return button
    }()
    
    @IBAction func loginButton(_ sender: AnyObject) {
        
        handleRegister()
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var loginRegisterButton: UIButton!
    
    func setupGoogleRegisterButton() {
        //need x, y, width, height constraints
        googleRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleRegisterButton.bottomAnchor.constraint(equalTo: loginRegisterButton.topAnchor, constant: -5).isActive = true
        googleRegisterButton.widthAnchor.constraint(equalTo: loginRegisterButton.widthAnchor).isActive = true
        googleRegisterButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
       // view.addSubview(googleRegisterButton)
       // setupGoogleRegisterButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

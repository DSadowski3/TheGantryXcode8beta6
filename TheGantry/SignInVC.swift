//
//  ViewController.swift
//  TheGantry
//
//  Created by Dominik Sadowski on 8/28/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet var emailField: SignInField!
    @IBOutlet var passwordField: SignInField!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.stringForKey(KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    @IBAction func fbButtonPressed(_ sender: AnyObject) {
       
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("DOMINIK: Unable to authenticat with FB - \(error)")
            } else if result?.isCancelled == true {
                print("DOMINIK: user cncelled fb authenticaiton")
            } else {
                print("DOMINIK: successfully authenticated with FB")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("DOMINIK: Unable to authenticate with Firebase")
            } else {
                print("DOMINIK: successfully atuhenticated with firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
            }
        })
    }
    @IBAction func signInTapped(_ sender: AnyObject) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("DOMINIK: Email User authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(id: user.uid)
                    }
                    
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("DOMINIK: Unable to authenticate with Firebase using email")
                        } else {
                            print("DOMINIK: Successfully authenticated with Firebase")
                            if let user = user{
                                self.completeSignIn(id: user.uid)
                            }
                          
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
        let keychainResult = KeychainWrapper.setString(id, forkey: KEY_UID)
        print("DOMNIK: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }

}


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

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
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
            }
        })
    }

}


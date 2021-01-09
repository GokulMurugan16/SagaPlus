//
//  ForgotPasswordViewController.swift
//  Saga Plus
//
//  Created by Gokul Murugan on 2021-01-09.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

    // MARK: Outlet
    @IBOutlet weak var E_Mail: UITextField!
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: Reset Link
    @IBAction func Reset_Link(_ sender: Any) {
        
        if(E_Mail.text == "")
                {
                alert(message: "Please enter email and try again", title: "Enter E-Mail!")
                }
        else
        {
            Auth.auth().sendPasswordReset(withEmail: E_Mail.text!) { error in
                
                if (error != nil )
                {
                    self.alert(message: "Please check your E-Mail and try again later", title: "Reset link unsuccessful")
                }
                else if (error == nil )
                {
                    self.alert(message: "Please check your E-Mail and login", title: "Reset link sent successfully")
                }
              
            }
        }
    }
    
}

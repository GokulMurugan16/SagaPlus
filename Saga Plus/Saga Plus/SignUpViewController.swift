//
//  SignUpViewController.swift
//  Saga Plus
//
//  Created by Gokul Murugan on 2021-01-09.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var E_Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    // MARK: View will Appear
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Sign_Up(_ sender: Any) {
        
        if(E_Mail.text == "" || Password.text == "")
                {
                let alert = UIAlertController(title: "Invalid Details", message: "Please enter valid credentials", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
        else
        {
            Auth.auth().createUser(withEmail: E_Mail.text!, password: Password.text!) { auth, error in
                if(auth != nil)
                {
                    self.E_Mail.text = ""
                    self.Password.text = ""
                }
                else
                {
                    let errCd = AuthErrorCode(rawValue: error!._code)
                    var errorAlert:String = ""
                    
                    switch errCd
                    {
                    case .credentialAlreadyInUse:
                        errorAlert = "Credential Already In Use"
                    case .emailAlreadyInUse:
                        errorAlert = "E-Mail Already In Use"
                    case .invalidCredential:
                        errorAlert = "Invalid Credential"
                    case .invalidEmail:
                        errorAlert = "Invalid E-Mail"
                    case .weakPassword:
                        errorAlert = "Weak Password"
                    
                    default:
                        errorAlert = "Sign Up Unsucessfull"
                    }
                    self.alert(message: "Please try again!" , title: errorAlert)
                }
            }
            
        }
        
    }
    
}

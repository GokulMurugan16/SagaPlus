//
//  ViewController.swift
//  Saga Plus
//
//  Created by Gokul Murugan on 2021-01-03.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var E_Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    // MARK: View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: View will Appear
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    // MARK: Google Sign In
    @IBAction func Google_SignIn(_ sender: Any) {
    }
    
    // MARK: Forgot Password
    @IBAction func Forgot_Password(_ sender: Any) {
    }
    
    // MARK: Sign Up
    @IBAction func Sign_Up(_ sender: Any) {
    }
    
    // MARK: Login Button
    @IBAction func Login_Button(_ sender: Any) {
        
        if(E_Mail.text == "" || Password.text == "")
                {
                let alert = UIAlertController(title: "Invalid Details", message: "Please enter valid credentials", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
        else
        {
            Auth.auth().signIn(withEmail: E_Mail.text!.lowercased(), password: Password.text!) {authResult, error in
                            if(authResult != nil)
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
                                case .wrongPassword:
                                    errorAlert = "Wrong Password"
                                case .invalidEmail:
                                    errorAlert = "Invalid Email"
                                case .invalidCredential:
                                    errorAlert = "Invalid Credential"
                                case .credentialAlreadyInUse:
                                    errorAlert = "Credential Already In Use"
                                case .userNotFound:
                                    errorAlert = "User Not-Found"
                                
                                default:
                                    errorAlert = "Sign Up Unsucessfull"
                                }
                                self.alert(message: "Please try again!" , title: errorAlert)
                            }
            }
    
        }
    }
}


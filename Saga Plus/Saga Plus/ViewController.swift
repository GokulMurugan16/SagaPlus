//
//  ViewController.swift
//  Saga Plus
//
//  Created by Gokul Murugan on 2021-01-03.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var E_Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Login Button
    @IBAction func Login_Button(_ sender: Any) {
        
        print(E_Mail.text)
        print(Password)
        
        
        
    }
    

}


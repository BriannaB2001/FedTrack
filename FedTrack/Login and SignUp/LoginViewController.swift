//
//  LoginViewController.swift
//  FedTrack
//
//  Created by Brianna Babcock on 3/1/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn.layer.cornerRadius = 20
        
    }
    
    @IBAction func signInTapped(_ sender: Any) {
    }
    
    @IBAction func wantToSignUpTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
}

//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Boris Ofon on 10/7/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              self.performSegue(withIdentifier: "LoginSegue", sender: self)
          } else {
              print(error?.localizedDescription)
          }
        }
        
    }
    
    
    
    @IBAction func onSignUp(_ sender: UIButton) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if error != nil{
                self.performSegue(withIdentifier: "LoginSegue", sender: self)
                print("Successsssss")
            }else{
                print(error?.localizedDescription)
                print("Errrororororor")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

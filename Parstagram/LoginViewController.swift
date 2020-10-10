//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Edgar Reyes on 10/9/20.
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
    
    @IBAction func onSignIn(_ sender: UIButton) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground {(success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }

      // Other fields can be set just like any other PFObject,
      // like this: user["attribute"] = "its value"
      // If this field does not exists, it will be automatically created

//      user.signUpInBackgroundWithBlock {
//        (succeeded: Bool, error: NSError?) -> Void in
//        if let error = error {
//          let errorString = error.userInfo["error"] as? NSString
//          // Show the errorString somewhere and let the user try again.
//        } else {
//          // Hooray! Let them use the app now.
//        }
//      }
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

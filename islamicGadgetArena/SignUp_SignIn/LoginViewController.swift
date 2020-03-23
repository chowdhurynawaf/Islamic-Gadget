

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var EmailTf_signIn: UITextField!
    
    
    @IBOutlet weak var PasswordTf_signIn: UITextField!
    
    
    
    @IBOutlet weak var FirstNameTf_signUp: UITextField!
    
    
    
    @IBOutlet weak var LastNameTf_signUp: UITextField!
    
    
    
    
    
    @IBOutlet weak var signUp_EmailTf: UITextField!
    
    
  
    
    
    @IBOutlet weak var signUp_PasswordTf: UITextField!
    
 
    
    
    @IBOutlet weak var passwordReset_EmailTf: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    
    @IBAction func signInBtnTapped(_ sender: Any) {
        
        if let email = EmailTf_signIn.text,let password = PasswordTf_signIn.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                if error != nil {
                    AlertControl.showAlert(self, title: "Something went wrong", message: "wrong username or password.please try again later")
                }
                else{
                    self.performSegue(withIdentifier: "signInToHome", sender: self)
                }
            }
            
        }
        
    }
    
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "forgotPassword", sender: self)
        
        
    }
    
    @IBAction func noAccountSignUp(_ sender: Any) {
        performSegue(withIdentifier: "noAccountSignUp", sender: self)
    }
    
//    @IBAction func signUpBtnTapped(_ sender: Any) {
//
//
//        let emailOfSignUpView = signUp_EmailTf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let passwordofSignUp = signUp_PasswordTf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        Auth.auth().createUser(withEmail: emailOfSignUpView!, password: passwordofSignUp!) { (user, error) in
//
//            if  error != nil{
//                AlertControl.showAlert(self, title: "Something went wrong", message: "Please input all the values correctly")
//            }
//            else{
//                self.performSegue(withIdentifier: "signUpToHome", sender: self)
//            }
//
//        }
//
//
//    }
//
    
//    @IBAction func haveAccountSignIn(_ sender: Any) {
//
//        performSegue(withIdentifier: "haveAccountSignIn", sender: self)
//
//    }
    
    
    
//    @IBAction func passwordReset(_ sender: Any) {
//        
//        
//        
//        
//        if let emailForPasswordReset = passwordReset_EmailTf.text{
//            Auth.auth().sendPasswordReset(withEmail: emailForPasswordReset) { (error) in
//                if error != nil{
//                    AlertControl.showAlert(self, title: "something went wrong", message: error!.localizedDescription)
//                }
//                
//                else{
//                    
//                    
//                    self.performSegue(withIdentifier: "forgotPasswordPageToSignIn", sender: self)
//                }
//            }
//        }
//    }
    
    

}



import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstName: UITextField!
    
    
    @IBOutlet weak var lastName: UITextField!
    
    
    @IBOutlet weak var signUp_emailTf: UITextField!
    
    
    @IBOutlet weak var SignUp_passwordTf: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        
        let db = Firebase.Firestore.firestore()

        
        
        let emailOfSignUpView = signUp_emailTf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
             let passwordofSignUp = SignUp_passwordTf.text?.trimmingCharacters(in: .whitespacesAndNewlines)
             
             Auth.auth().createUser(withEmail: emailOfSignUpView!, password: passwordofSignUp!) { (user, error) in
                 
                 if  error != nil{
                     AlertControl.showAlert(self, title: "Something went wrong", message: "Please input all the values correctly")
                 }
                 else{
                    
                    db.collection("users").document(String((user?.user.uid)!)).setData(["firstName":self.firstName.text!,"lastName":self.lastName.text!])
                    
                     self.performSegue(withIdentifier: "signUpToHome", sender: self)
                 }
                 
             }
             
    }
    
    
    
    @IBAction func haveAccountSignIn(_ sender: Any) {
        
        performSegue(withIdentifier: "haveAccountSignIn", sender: self)
    }
    
    
    
    

   
}

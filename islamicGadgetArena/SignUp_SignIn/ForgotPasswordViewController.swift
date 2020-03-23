

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var forgotPassword_Emailtf: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetYourPasswordBtn(_ sender: Any) {
        
         if let emailForPasswordReset = forgotPassword_Emailtf.text{
                   Auth.auth().sendPasswordReset(withEmail: emailForPasswordReset) { (error) in
                       if error != nil{
                           AlertControl.showAlert(self, title: "something went wrong", message: error!.localizedDescription)
                       }
                       
                       else{
                           
                           
                           self.performSegue(withIdentifier: "forgotPasswordPageToSignIn", sender: self)
                       }
                   }
               }
        
        
    }
    
}

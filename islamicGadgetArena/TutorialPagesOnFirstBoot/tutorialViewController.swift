

import UIKit

class tutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

            }
    
    // TODO: skip buttons of tutorial page functionality
    //_________________________________________________
    @IBAction func firstButton(_ sender: Any) {
        print("skipped")
        
        performSegue(withIdentifier: "firstSkipToSignUp", sender: self)
    }
    
    @IBAction func secondButton(_ sender: Any) {
        print("skipped 2")
        performSegue(withIdentifier: "secondSkipToSignUp", sender: self)
    }
    
    @IBAction func thirdButton(_ sender: Any) {
        print("skipped 3")
        performSegue(withIdentifier: "thirdSkipToSignUp", sender: self)
    }
    
    //__________________________________________________________
    
    


}

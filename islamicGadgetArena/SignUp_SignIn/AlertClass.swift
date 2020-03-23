import UIKit

class AlertControl{
    static func showAlert (_ inViewController : UIViewController ,title : String , message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        
        alert.addAction(action)
        
        inViewController.present(alert, animated: true, completion:nil)
        
    }
}

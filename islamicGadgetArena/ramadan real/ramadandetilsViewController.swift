

import UIKit

class ramadandetilsViewController: UIViewController {
    @IBOutlet weak var ramadanarbi: UILabel!
    
    @IBOutlet weak var ramadanenglish: UILabel!
    @IBOutlet weak var ramadanmeining: UILabel!
    
    var arbi: String?
    var english: String?
    var meining: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let arbi = arbi, let english = english, let meining = meining else{
            return
        }
        
        ramadanarbi.text = arbi
        ramadanenglish.text = english
        ramadanmeining.text = meining
        // Do any additional setup after loading the view.
    }


}

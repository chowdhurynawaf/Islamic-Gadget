

import UIKit

class kalimadetilseViewController: UIViewController {
    
    @IBOutlet weak var kalemaTL3: UILabel!
    @IBOutlet weak var kalemaTL2: UILabel!
    @IBOutlet weak var kalemaTL1: UILabel!
    var kalemaLB3: String?
    var kalemaLB2: String?
    var kalemaLB1: String?

    override func viewDidLoad() {
    
        super.viewDidLoad()
       kalemaTL1.layer.cornerRadius = 7
       kalemaTL1.layer.masksToBounds = true
        kalemaTL2.layer.cornerRadius = 7
        kalemaTL2.layer.masksToBounds = true
        kalemaTL3.layer.cornerRadius = 7
        kalemaTL3.layer.masksToBounds = true

        
        guard let kalemaLB1 = kalemaLB1, let kalemaLB2 = kalemaLB2, let kalemaLB3 = kalemaLB3 else {
                   return
               }
               
        kalemaTL1.text = kalemaLB1
        kalemaTL2.text = kalemaLB2
        kalemaTL3.text = kalemaLB3
           }
           
        


        // Do any additional setup after loading the view.
    

    }
    






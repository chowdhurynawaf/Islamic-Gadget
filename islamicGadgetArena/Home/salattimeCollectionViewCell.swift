

import UIKit

class salattimeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var salatTimeLB: UILabel!
    
    @IBOutlet weak var salatNameLB: UILabel!
    @IBOutlet weak var salatTimeview: UIView!
    
    override func awakeFromNib() {
           super.awakeFromNib()
        
        
//        salatTimeview.layer.cornerRadius = salatTimeview.frame.width / 2
        //salatTimeview.layer.cornerRadius = 63.8/2
       }
    
}

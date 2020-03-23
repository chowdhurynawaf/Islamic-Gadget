

import UIKit

class Zakat2TableViewCell: UITableViewCell {
    @IBOutlet weak var zakatEssential: UIImageView!
    
    @IBAction func cashInput(_ sender: Any) {
    }
    
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var roundedView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView.layer.cornerRadius = 13
        
        
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}



import UIKit

class Hajj2TableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var hajjAhkam: UIImageView!
    
    @IBOutlet weak var expandedLbl: UILabel!
    @IBOutlet weak var btnExpand: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
         roundedView.layer.cornerRadius = 13
        hajjAhkam.sizeToFit()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    

       
    }
    
    

}

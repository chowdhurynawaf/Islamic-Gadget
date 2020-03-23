

import UIKit

class customsalatTableViewCell: UITableViewCell {
    @IBOutlet weak var salatview2: UIView!
    @IBOutlet weak var salattext2: UILabel!
    
    @IBOutlet weak var salattext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        salatview2.layer.cornerRadius = 8
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

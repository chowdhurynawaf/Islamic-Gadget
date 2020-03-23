

import UIKit

class locationTableViewCell: UITableViewCell {
    @IBOutlet weak var locationview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        locationview.layer.cornerRadius = 9
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



import UIKit

class salatTableViewCell: UITableViewCell {

    @IBOutlet weak var salatview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        salatview.layer.cornerRadius = 8
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

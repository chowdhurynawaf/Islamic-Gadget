

import UIKit

class ZakatTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var zakatTVCellImg: UIImageView!
    
    @IBOutlet weak var inputTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView.layer.cornerRadius = 13
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        
    }

}

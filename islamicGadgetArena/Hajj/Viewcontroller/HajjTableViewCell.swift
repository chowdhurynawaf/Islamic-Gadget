

import UIKit

class HajjTableViewCell: UITableViewCell {
    
    @IBOutlet weak var roundedView: UIView!

    @IBOutlet weak var hajjBtn: UIButton!
    @IBOutlet weak var hajjAhkamSymbol: UIImageView!
    
    @IBOutlet weak var hajjAhkamText: UIImageView!
    
  override func awakeFromNib() {
        super.awakeFromNib()
    roundedView.layer.cornerRadius = 13

      
    }
    
    @IBAction func goWhatToDo(_ sender: Any) {
 
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

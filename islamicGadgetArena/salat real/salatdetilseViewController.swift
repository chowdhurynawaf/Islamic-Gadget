

import UIKit

class salatdetilseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var salatdetilstableview: UITableView!
    var duaname : String?
    var detiles : String?
    var douaname = ["Mosque","Qibla","Seheri","fazayel","111","21","31","41","51","61"]
    
    var selectedindex = -1
    var isCollepce = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        salatdetilstableview.estimatedRowHeight = 150
        salatdetilstableview.rowHeight = UITableView.automaticDimension
        
//        guard let duaname = duaname, let detilse = detiles else {
//            return
//        }

        // Do any additional setup after loading the view.
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedindex.self == indexPath.row && isCollepce == true{
            return 150
        }else{
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return douaname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let salatcell = tableView.dequeueReusableCell(withIdentifier: "mysalatCell", for: indexPath) as! customsalatTableViewCell
        salatcell.salattext.text = douaname[indexPath.row]
        salatcell.salattext2.text = douaname[indexPath.row]
        
        return salatcell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedindex == indexPath.row{
            if self.isCollepce == false{
                self.isCollepce = true
            }else{
                self.isCollepce = false
            }
        }else{
            self.isCollepce = true
        }
        self.selectedindex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}

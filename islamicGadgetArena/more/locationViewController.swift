

import UIKit

class locationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var mqlocation = ["Menu 1","Menu 2","Menu 3","Menu 4","Menu 5","Menu 6","Menu 7","Menu 8","Menu 9","Menu 10","Menu 11","Menu 12",]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mqlocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let locationcell = tableView.dequeueReusableCell(withIdentifier: "mylocationCell", for: indexPath) as! locationTableViewCell
        return locationcell
    }
    
}

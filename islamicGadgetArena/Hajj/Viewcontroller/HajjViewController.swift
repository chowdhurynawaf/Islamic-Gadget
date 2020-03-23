

import UIKit

class HajjViewController: UIViewController {
    //let cellspacingHeight:CGFloat = 40
        
    var hajjSymbol:[UIImage] = [#imageLiteral(resourceName:"hajjSymbol"),#imageLiteral(resourceName:"umrahSymbol"),#imageLiteral(resourceName:"duaSymbol"),#imageLiteral(resourceName:"hajjMapSymbol"),#imageLiteral(resourceName:"importantInformationSymbol")]
    
    var hajjAhkamText:[UIImage] = [#imageLiteral(resourceName: "whatToDo.png"),#imageLiteral(resourceName: "umrahText.png"),#imageLiteral(resourceName: "duaText.png"),#imageLiteral(resourceName: "hajjMapText.png"),#imageLiteral(resourceName: "importantInformationText.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
       
    }
   
    
}

extension HajjViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return hajjSymbol.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hajjAhkamCell") as! HajjTableViewCell
        cell.hajjAhkamSymbol.image = hajjSymbol[indexPath.row]
        cell.hajjAhkamText.image = hajjAhkamText[indexPath.row]
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 20
        cell.layer.cornerRadius = 13
        cell.clipsToBounds = true
        tableView.separatorColor = UIColor.clear
        
    
        
        return cell
    }

  
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellspacingHeight
//    }
    
    
}


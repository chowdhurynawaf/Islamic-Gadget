

import UIKit

class Zakat2ViewController: UIViewController {
    var zakatEssentialArray:[UIImage] = [#imageLiteral(resourceName:"essential1"),#imageLiteral(resourceName:"essential2"),#imageLiteral(resourceName:"essential3")]
    var zakatEssentialTextArray = ["Zakat is a religious obligation, ordering all Muslims who meet the necessary criteria to donate a certain portion of wealth each year to charitable causes. Giving away money to the poor is said to purify yearly earnings that are over and above what is required to provide the essential needs of a person or family.",
        "Zakat is an Islamic finance term referring to the obligation that an individual has to donate a certain proportion of wealth each year to charitable causes. Zakat is a mandatory process for Muslims and is regarded as a form of worship. Giving away money to the poor is said to purify yearly earnings that are over and above what is required to provide the essential needs of a person or family.",
        "Zakat is one of the Five Pillars of Islam: the others are declaration of faith, prayer, fasting during Ramadan and the Hajj pilgrimage. It is a compulsory procedure for Muslims earning above a certain threshold and should not be confused with Sadaqah, a term that refers to giving charitable gifts out of kindness or generosity."]
    
    @IBOutlet weak var zakatTableView: UITableView!
    var selectedIndex = -1
    var isCollapse = false
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zakatTableView.estimatedRowHeight = 247
        zakatTableView.rowHeight = UITableView.automaticDimension

        
    }
    
    
    @IBAction func goBackToZakat(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
extension Zakat2ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zakatEssentialArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zakatEssentialCell", for: indexPath) as! Zakat2TableViewCell
        cell.zakatEssential.image = zakatEssentialArray[indexPath.row]
        cell.layer.borderWidth = 20
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.cornerRadius = 13
        tableView.separatorColor = UIColor.clear
        cell.clipsToBounds = true
        
        cell.btnExpand.addTarget(self,action:#selector(handleExpandClose),for: .touchUpInside)
        //cell.spacingHeight:CGFloat = 20
       
        
        
        
        return cell
    }
    
    @objc func handleExpandClose(sender:UIButton){
        print("Trying to expand and close")
        for row in zakatEssentialTextArray[0].indices{
            print (0,row)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex.self == indexPath.row && isCollapse == true{
            return 247
        }else{
            return 95
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row{
            if self.isCollapse == false{
                self.isCollapse = true
            }else{
                self.isCollapse = false
            }
        }
            
            else{
                self.isCollapse = true
            }
           self.selectedIndex = indexPath.row
          tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    
}
      
    
    
    




import UIKit

class Hajj2ViewController: UIViewController {
    //let cellspacingHeight:CGFloat = 40
    
    var hajjAhkamArray:[UIImage] = [#imageLiteral(resourceName: "ihram.png"),#imageLiteral(resourceName: "headToMina.png"),#imageLiteral(resourceName: "ArafahDay.png"),#imageLiteral(resourceName: "pebbles.png"),#imageLiteral(resourceName: "stonesThroughing.png"),#imageLiteral(resourceName: "finalDaysMina.png")]
    var hajjtextArray = ["hajj literal meaning of the word Hajj is heading to a place for the sake of visiting",
                     
        "In Islamic terminology, Hajj is a pilgrimage made to Kaaba, the House of Allah",
                     
        "in the sacred city of Mecca in Saudi Arabia. The rites of Hajj are performed over five or six days, beginning on the eighth and ending on the thirteenth day of Dhu al-Hijjah, the last month of the Islamic calendar ",
        
        "t is one of the five pillars of Islam, alongside Shahadah, Salat, Zakat and Sawm. The Hajj is the second largest annual gathering of Muslims in the world, after the Arba'een Pilgrimage in Karbala, Iraq",
        
        "The state of being physically and financially capable of performing the Hajj is called istita'ah, and a Muslim who fulfills this condition is called a mustati.",
        
        "The Hajj is a demonstration of the solidarity of the Muslim people, and their submission to God (Allah).[8][9] The word Hajj means to attend a journey, which connotes both the outward act of a journey and the inward act of intentions."]
    
    var selectedindex = -1
    var isCollapse = false
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.estimatedRowHeight = 247
        tableViewOutlet.rowHeight = UITableView.automaticDimension
        
        
      
       
    }
    @IBAction func goBackHajjBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var arrowBackHajj: [UIImageView]!

  
    
}

extension Hajj2ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return hajjAhkamArray.count
       //return (self.hajjAhkamArray[section] = 0) ? 0 : 4
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedindex.self == indexPath.row && isCollapse == true{
            
       
            return 247
           
        }else{
            return  95
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hajj2AhkamCell") as! Hajj2TableViewCell

        cell.hajjAhkam.image = hajjAhkamArray[indexPath.row]
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 20
        cell.layer.cornerRadius = 13
        cell.clipsToBounds = true
        tableView.separatorColor = UIColor.clear
        cell.btnExpand.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        cell.expandedLbl.text = hajjtextArray[indexPath.row]
        
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedindex == indexPath.row{
            if self.isCollapse == false{
                self.isCollapse = true
            }else{
                self.isCollapse = false
            }
        }else{
            self.isCollapse = true
        }
        self.selectedindex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }


    
    
    @objc func handleExpandClose(sender: UIButton) {
      print("Tryig to handle expand and close")
        for row in hajjtextArray[0].indices{
            print(0,row)
        }
    }
 

    
    
}




import UIKit
import StoreKit
import Firebase
import CoreLocation
import UserNotifications


var lat = UserDefaults.standard.double(forKey: "lat")
var lon = UserDefaults.standard.double(forKey: "lon")



class HomeViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    
    
    var locationManager = CLLocationManager()


    var counter = 0
    
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var sidepanelView: UIView!
    
    var indexNo : Int?
    
    @IBOutlet weak var profilePic: UIImageView!
    
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var HizriLbl: UILabel!
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    @IBOutlet weak var collectionView2: UICollectionView!
    
    
    @IBOutlet weak var salatNamelbl: UILabel!
    
    
    @IBOutlet weak var salatStartingTimeLbl: UILabel!
    
    @IBOutlet weak var salatTimeLblofFirstCollectionView: UILabel!
    

    
    
    var arr = ["Login/Signup" , "Notification" , "Rating" ,"Share"  ]
    var salatName = ["Fajr","Dohur","Asr","Magrib","Isha"]
    var salatSchedule = ["04.00 AM" , "12.30 PM" , "16.00 PM" , "18.10 PM" ," 20.00 PM"]
    var ContentImageSet = [UIImage(named:"kalima.png"),UIImage(named:"salat.png"),UIImage(named:"ramadan.png") ,UIImage(named:"hajj.png"),UIImage(named:"zakat.png"),UIImage(named:"more.png")]
    var salatTimeArr = [String]()
    var salatTimeFirstPortion = [String]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(HomeViewController.trigger), userInfo: nil, repeats: true)
        
        SalatTime()
        weatherCondition()

        InternetCheck()
       
       sidepanelView.isHidden = true


       profilePic.isHidden = true
       profilePic.layer.cornerRadius = 10

       profilePic.clipsToBounds = true

       checkIfUserIsSignedIn()

    

        let time = currentTime()
        let gregorianDate = gregorian()
        let hijriDate = hijri()

        timeLbl.text = time
        dateLbl.text = gregorianDate
        HizriLbl.text = hijriDate
        

        
        
    }
    
    @objc func trigger()
    {
        var time = currentTime()
        timeLbl.text = time
        var splitedArr = time.components(separatedBy: " ")
        
        var timeInFloat = (splitedArr[0] as NSString).doubleValue
        var salatToPray = salatTimeChecking(condition: timeInFloat)
        salatNamelbl.text = salatToPray
    
        
    }
    
    
    //TODO: checking internet
    
    func InternetCheck(){
        let networkCheck = isConnectedToInternet()
        
        if networkCheck == false{
            AlertControl.showAlert(self, title: "No Internet", message: "you need to enable internet to see the right salat time")
        }
    }
    
    
    //TODO: checking salatTime according to current local time
    
    func salatTimeChecking(condition: Double) -> String {
        
   
       switch (condition) {
       
       case 00.01...1.00 :
        salatStartingTimeLbl.text = "00.01 AM"
        
               return "Midnight"
           
       case 1.01...4.00 :
        salatStartingTimeLbl.text = "01.01 AM"

               return "Tahajjud"
           
       case 4.01...6.00 :
        salatStartingTimeLbl.text = "\(salatTimeArr[0].split(separator: " ")[0]) AM"
               return "Fajr"
           
       case 6.01...9.15 :
        salatStartingTimeLbl.text = "06.01 AM"

               return "Ishraq"
           
       case 9.16...12.00 :
        salatStartingTimeLbl.text = "09.16 AM"

               return "Chast"
           
       case 12.01...15.00 :
        salatStartingTimeLbl.text = "\(salatTimeArr[1].split(separator: " ")[0]) PM"
               return "Duhur"
           
       case 15.01...18.00 :
        salatStartingTimeLbl.text = "\(salatTimeArr[2].split(separator: " ")[0]) PM"
               return "Asr"
           
       case 18.01...19.30 :
        salatStartingTimeLbl.text = "\(salatTimeArr[3].split(separator: " ")[0]) PM"
               return "Magrib"
           
       case 19.31...24.00 :
        salatStartingTimeLbl.text = "\(salatTimeArr[4].split(separator: " ")[0]) PM"
               return "Isha"
           
          
           
           default :
               return "Salat Time"
           }

       }
    
    //TODO: SALAT TIME API CALL
    
    func SalatTime(){
        
        URLSession.shared.dataTask(with: URL(string: "http://api.aladhan.com/v1/calendar?latitude=23.6850&longitude=90.3563&method=2&month=\(month)&year=\(year)")!) { (data, response, error) in
            
            guard let data = data else{
                return
            }
            
            let post = try! JSONDecoder().decode(Salat.self,from:data)
            
            let salatNames = post.data[0].timings
           
            
            let ins = post.data[0].timings
            
            let mirror = Mirror(reflecting: ins)
            
            for child in mirror.children{
            
                self.salatTimeArr.append(child.value as! String)
              
            }
           
            DispatchQueue.main.async {
                
                
                 self.collectionView1.reloadData()
            }
            
            
        }.resume()
    }
    
    
    
    //TODO: weather API call

    func weatherCondition(){

        let API = "http://api.openweathermap.org/data/2.5/weather?lat=23.6850&lon=90.3563&appid=e1a5bc43ba74c4e01acc53fff3aa3a40"

        URLSession.shared.dataTask(with: URL(string: API)!) { (data, response, error) in

               guard let data = data else{
                   return
               }

               let weatherConditionData = try! JSONDecoder().decode(Weather.self,from:data)
               var weatherCode = weatherConditionData.weather[0].id
            
            
            DispatchQueue.main.async {
                self.weatherImage.image = UIImage(named: updateWeatherIcon(condition: weatherCode))
            }
               
           }.resume()
        
    }
    
    
    
    //TODO: Date Formatting in hijri
    
    func hijri() -> String{
        let hijri = Calendar(identifier: .islamic)
        

        let formatter = DateFormatter()
        formatter.calendar = hijri
        formatter.dateFormat = "d MMMM yyyy"

        let today = Date()
        let dateString = formatter.string(from: today)

       
        
        return dateString
    }
    
    //TODO: gregorian date formatting
    
    func gregorian() -> String{
        let date = Calendar(identifier: .gregorian)
        

        let formatter = DateFormatter()
        formatter.calendar = date
        formatter.dateFormat = "E d MMM "

        let today = Date()
        let dateString = formatter.string(from: today)

        return dateString
    }
    
    
    //TODO: Time formatting
    
    func currentTime() -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH mm a"
        //formatter.timeStyle = .short
        let dateTimeString = formatter.string(from: currentDateTime)
        return dateTimeString
    }
    
    //TODO: Location manage
    
    func locations(){
        
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() == .authorizedAlways) {
           currentLoc = locationManager.location
         
        }
        
    }
    
    
    //TODO: checking internet
    
    func isConnectedToInternet() -> Bool {
    let hostname = "google.com"
    //let hostinfo = gethostbyname(hostname)
    let hostinfo = gethostbyname2(hostname, AF_INET6)//AF_INET6
    if hostinfo != nil {
        return true // internet available
      }
     return false // no internet
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: tableView Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! customTableViewCell
        cell.CellLbl.text = arr[indexPath.row]
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexNo = indexPath.row
        
        if arr[indexNo!] == "Login/Signup" {
            
            
            performSegue(withIdentifier: "hola", sender: self)
        }
        
        
        
        if arr[indexNo!] == "Logout"{
            do{
                try Auth.auth().signOut()
            }catch{
                AlertControl.showAlert(self, title: "Something went wrong", message: "Didn't Logout successfully")
            }
        }
        
        
        if arr[indexNo!] == "Share"{
            let activityVc = UIActivityViewController(activityItems: ["https://apps.apple.com/ai/app/scanner-for-pdf/id1487613318"], applicationActivities: nil)
            activityVc.popoverPresentationController?.sourceView = self.view
            self.present(activityVc, animated: true, completion: nil)
            
            
        }
        
        if arr[indexNo!] == "Rating"{
            

            SKStoreReviewController.requestReview()
        }
        
        
        if arr[indexNo!] == "Notification"{
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Notification", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
            
            self.present(newViewController, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func menuBtn(_ sender: Any) {
        tblView.reloadData()
        
        counter = counter + 1
        
        if counter%2 != 0{
            
            self.sidepanelView.isHidden = false
        }
        
        else {
            self.sidepanelView.isHidden = true
        }
        
        
    }
    
    
    //TODO: Checking weather user signed in or not
    
    private func checkIfUserIsSignedIn() {

        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.arr = [ "Notification" , "Rating" , "Share" , "Logout" ]
                           
                           DispatchQueue.main.async {
                               self.tblView.reloadData()
                           }
                
                self.profilePic.isHighlighted = false
                
                // user is signed in
                // go to feature controller
            } else {
                
                self.arr = ["Login/Signup" , "Notification"  , "Rating" , "Share" ]
                
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                 // user is not signed in
                 // go to login controller
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView1{
            return salatName.count

        }
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        //salatCell.salatNameLB.text = salatName[indexPath.row]
        if collectionView == collectionView1{
            let salatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "salattimeCell", for: indexPath) as! salattimeCollectionViewCell
            salatCell.salatTimeLB.text = salatName[indexPath.row]
            
            salatCell.salatNameLB.text = self.salatSchedule[indexPath.row]
            
           
            
                   return salatCell
        }else{
            let contentcell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath)as! contentCollectionViewCell
            
            contentcell.contentImageView.image = ContentImageSet[indexPath.row]
            return contentcell
            
        }

       
    }
    
    
    //TODO: CollectionView Delegate method
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView1{
            let width = (collectionView.frame.width - 40) / 5
                   let height = width
                   
                   return CGSize(width: width, height: height)
        }else{
            let width = (collectionView.frame.width - 40) / 3
                   let height = width
                   
                   return CGSize(width: width, height: height)
        }
        
       
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        if collectionView == collectionView2{
            if indexPath.row == 0{
                    performSegue(withIdentifier: "kalimaSegue", sender: nil)
                       
                   }
                   else if indexPath.row == 1{
                       performSegue(withIdentifier: "salat", sender: nil)
                   }
                   else if indexPath.row == 2{
                
                performSegue(withIdentifier: "ramadan", sender: nil)
                   }
                   else if indexPath.row == 3{
                        performSegue(withIdentifier: "hajjSegue", sender: nil)
                   }
                   else if indexPath.row == 4{
                    performSegue(withIdentifier: "zakatSegue", sender: self)
                   }
                   else if indexPath.row == 5{
                performSegue(withIdentifier: "moreSegue", sender: self)
                   }
                   
        }
        
    }
    
    
}



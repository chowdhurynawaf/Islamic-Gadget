

import UIKit
let vc = HomeViewController()
var listOfSalat = [String]()


class NotificationViewController: UIViewController {
    
    
    
    @IBOutlet weak var notificationSwitch: UISwitch!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(vc.salatTimeArr)
        listOfSalat = vc.salatTimeArr
        print(listOfSalat)
        notificationSwitch.isOn = false
        removeAllPendingAndDeliveredNotifications()
        

        
//        self.vc.salatTimeArr
//        var salatTimeList = vc.salatTimeArr

        // Do any additional setup after loading the view.
        
//        DispatchQueue.main.async {
//            self.vc.salatTimeArr
//
//        }
    }
    

    @IBAction func NotificationSwitch(_ sender: UISwitch) {
        
        
        if sender.isOn{
           notificationOn()
        }
        else{
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        }


    }
    
    func removeAllPendingAndDeliveredNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func notificationOn(){
        

        let center = UNUserNotificationCenter.current()
               
               center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
               }
               
               // Step 2: Create the notification content
               let content = UNMutableNotificationContent()
               content.title = " prayer Notification!"
               content.body = "Time for pray!"
               
               // Step 3: Create the notification trigger
               let date = Date().addingTimeInterval(10)
               
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        dateComponents.hour = Int(4.00)
        dateComponents.hour = Int(12.00)
        dateComponents.hour = Int(16.00)
        dateComponents.hour = Int(18.30)
        dateComponents.hour = Int(20.00)
           
        
              
               
               let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
               
               // Step 4: Create the request
               
               let uuidString = UUID().uuidString
               
               let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
               
               // Step 5: Register the request
               center.add(request) { (error) in
                   // Check the error parameter and handle any errors
               }
    }
    

}

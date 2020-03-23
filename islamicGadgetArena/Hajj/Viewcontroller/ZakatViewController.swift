

import UIKit

class ZakatViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var cashInput: UITextField!
    
    @IBOutlet weak var goldInput: UITextField!
    
    @IBOutlet weak var assetInput: UITextField!
    
    @IBOutlet weak var totalLbl: UILabel!
    
    @IBOutlet weak var zakatAmountLbl: UILabel!
    
    var zakatCalculator:[UIImage] = [#imageLiteral(resourceName:"Cash"),#imageLiteral(resourceName:"Gold"),#imageLiteral(resourceName:"Asset"),#imageLiteral(resourceName:"Total"),#imageLiteral(resourceName:"Amount")]
    var zakatInputArray = [UITextField]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cashInput.layer.cornerRadius = 15
        cashInput.clipsToBounds = true
        goldInput.layer.cornerRadius = 15
        goldInput.clipsToBounds = true
        assetInput.layer.cornerRadius = 15
        assetInput.clipsToBounds = true
        totalLbl.layer.cornerRadius = 15
        totalLbl.clipsToBounds = true
        zakatAmountLbl.layer.cornerRadius = 15
        zakatAmountLbl.clipsToBounds = true
        cashInput.delegate = self
        goldInput.delegate = self
        self.hideKeyboard()
       
    }
   
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        var cashInputTaka = "0"
        cashInputTaka = cashInput.text!
        let cashInputForSum = Int(cashInputTaka)
     
        var assetInputTaka = "0"
        assetInputTaka = assetInput.text!
        let assetInputForSum = Int(assetInputTaka)
        //var defaultValue = "0"
        
        var goldInputTaka = "0"
        goldInputTaka = goldInput.text!
        let goldInputForSum = Int(goldInputTaka)
        
        totalLbl.text = "\(cashInputForSum! + assetInputForSum! + goldInputForSum!*4600 )"
        let totalLblAmount = Int(totalLbl.text!)
        zakatAmountLbl.text = "\(totalLblAmount!/40)"
        print(totalLbl.text ?? "0")
        print(zakatAmountLbl.text ?? "0")
    }
    
}
extension ZakatViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zakatCalculator.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zakatCustomCell") as! ZakatTableViewCell
        cell.zakatTVCellImg.image = zakatCalculator[indexPath.row]
        tableView.separatorColor = UIColor.clear
        return cell
    }
}
extension UIViewController{
    func hideKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
               view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
           view.endEditing(true)
       }
}



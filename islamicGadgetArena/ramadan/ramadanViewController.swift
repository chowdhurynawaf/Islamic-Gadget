

import UIKit

class ramadanViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    var ramdandua = ["اللَّهُمَّ لَكَ صُمْتُ وَ عَلَى رِزْقِكَ أَفْطَرْتُ وَ عَلَيْكَ تَوَكَّلْتُ",]
    
    var ramdanduaenglish = ["ALLAAHUMMA LAKA S'UMTU WA A'LAA RIZQIKA AFT'ARTUWA A'LAYKA TAWAWKKALTU"]
    
    var ramdanduameinin = ["O my Allah, for Thee, I fast, and with the food Thou gives me I break the fast, and I rely on Thee."]
    
    var image = ["Mosque","Qibla","Seheri","fazayel","111","21","31","41","51","61"]
    var indexno2 : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ramadancollectionviewCell", for: indexPath)as! ramadanCollectionViewCell
        cell.ramadanimage.image = UIImage (named: image[indexPath.row] + ".png")
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexno2 = indexPath.item
        performSegue(withIdentifier: "ramadant to ramadandetils", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc2 = segue.destination as! ramadandetilsViewController
        vc2.arbi = ramdandua[indexno2!]
        vc2.english = ramdanduaenglish[indexno2!]
        vc2.meining = ramdanduameinin[indexno2!]
        
        guard let indexno2 = indexno2 else{
          return
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "ramadantableviewCell", for: indexPath)as! ramadanTableViewCell
        return cell2
    }
    
}

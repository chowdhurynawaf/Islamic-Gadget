

import UIKit

class salatViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var image = ["Mosque","Qibla","Seheri","fazayel","111","21","31","41","51","61"]

//    var salatindexNo: Int?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mysalatcollectionviewCell", for: indexPath)as!myCollectionViewCell
        cell.salatimag.image = UIImage(named: image[indexPath.row] + ".png")
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//                salatindexNo = indexPath.item
performSegue(withIdentifier: "salat to salatdetiles", sender: self)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    let salatdata = segue.destination as! salatdetilseViewController
//        guard let salatindexNo = salatindexNo else{
//            return
//        }
//        salatdata.duaname = image[salatindexNo]
//        salatdata.detiles = image[salatindexNo]
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "mytableviewCell", for: indexPath)as! salatTableViewCell
        return cell2
    }
    

}

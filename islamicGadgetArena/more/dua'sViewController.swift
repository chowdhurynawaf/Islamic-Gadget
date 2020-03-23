

import UIKit

class dua_sViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var duas = ["Menu 1","Menu 2","Menu 3","Menu 4","Menu 5","Menu 6","Menu 7","Menu 8","Menu 9","Menu 10","Menu 11","Menu 12",]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return duas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let duascell = collectionView.dequeueReusableCell(withReuseIdentifier: "myduaCell", for: indexPath)as! dua_sCollectionViewCell
        duascell.duaimage.image = UIImage(named: duas[indexPath.row] + ".png")
        return duascell
    }
    

}

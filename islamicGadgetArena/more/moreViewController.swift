

import UIKit

class moreViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    var moreimages = ["Daily Doa","Mosque Location","Qibla Compus-3","Tasbih","quran","Seheri and Ifter-2","more"]
    var indexno : Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let morecell = collectionView.dequeueReusableCell(withReuseIdentifier: "mymoreCell", for: indexPath)as! moreCollectionViewCell
        morecell.moreimage.image = UIImage(named: moreimages[indexPath.row] + ".png")
        return morecell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexno = indexPath.item
        switch indexno {
        case 0:
            performSegue(withIdentifier: "mor to dua", sender: self)
            case 1:
            performSegue(withIdentifier: "mor to location", sender: self)
            case 2:
            performSegue(withIdentifier: "moreToCompassViewController", sender: self)
            
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 8) / 3
    let height = width
    
    return CGSize(width: width, height: height)

}


}

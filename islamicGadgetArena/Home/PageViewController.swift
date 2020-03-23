


import UIKit




class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    
    var pageControl = UIPageControl()
    
    // MARK: UIPageViewControllerDataSource
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "first"),
                self.newVc(viewController: "second"),
                self.newVc(viewController: "third"),
                
                ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        
        
        configurePageControl()
        
        // Do any additional setup after loading the view.
    }

    func configurePageControl() {
        

        // The total number of pages that are available is based on how many available colors we have.
      pageControl = UIPageControl(frame: CGRect(x: -100,y: UIScreen.main.bounds.maxY - 100,width: UIScreen.main.bounds.width,height: 50))
        
        
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
//        self.pageControl.tintColor = UIColor(hex: "#7e7e53")
        self.pageControl.tintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
//        self.pageControl.pageIndicatorTintColor = UIColor(hex: "#7e7e53")
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.3254901961, alpha: 1)
//        self.pageControl.currentPageIndicatorTintColor = UIColor(hex: "#bfc07c")
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.7490196078, green: 0.7529411765, blue: 0.4862745098, alpha: 1)
        self.pageControl.transform = CGAffineTransform(scaleX: 2, y: 2); // Looks better!
        self.view.addSubview(pageControl)
        
        
        
        
        
        
        
    }
    
    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    
    // MARK: Delegate methord
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
        

        
        
        

        
        
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex  = orderedViewControllers.index(of: viewController ) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            //return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        
       
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            //return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            
            
          return nil
            

            
          
            
            
//            var vc = UIViewController()
//
//            vc = ((self.storyboard?.instantiateViewController(withIdentifier: "signUp"))!)
//
//             return vc
            
            
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    func popToRootViewController(tabIndex: Int) {
    if let navigationViewController = self.viewControllers?[tabIndex] as? UINavigationController {
        navigationViewController.popToRootViewController(animated: false)
    }
    
    
    
    

}
}

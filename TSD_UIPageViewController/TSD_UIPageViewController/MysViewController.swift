//
//  MysViewController.swift
//  TSD_UIPageViewController
//
//  Created by Anton Zyabkin on 06.07.2022.
//

import UIKit

class MysViewController: UIPageViewController {

    
    
    //MARK: - Variable
    var cars = [CarsHelper]()
    let bmv = UIImage (named: "1")
    let audi = UIImage (named: "2")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "cars"
        
        let firspCar = CarsHelper (name: "Car - BMV", image: bmv!)
        
        let secondCar = CarsHelper (name: "Audi", image: audi!)
        
        cars.append(firspCar)
        cars.append(secondCar)
    }

    //MARK: - Create VC
    
    lazy var arrayCarViewController : [CarViewController] = {
        
        var carsVC = [CarViewController]()
        
        for car in cars {
            carsVC.append(CarViewController (carWith: car))
        }
        
        return carsVC
    }()
    
    //MARK: - Init UIPageViewController
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = .green
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MysViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayCarViewController[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarViewController.firstIndex(of: viewController) {
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
        }
        return nil

    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    

}

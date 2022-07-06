//
//  CarViewController.swift
//  TSD_UIPageViewController
//
//  Created by Anton Zyabkin on 06.07.2022.
//

import UIKit

class CarViewController: UIViewController {

    //MARK: - Image
    private let carImage : UIImageView = {
        let view = UIImageView ()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
       return view
    }()
    
    
    //MARK: - label
    
    private let nameLabel : UILabel = {
        let label = UILabel ()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView : [UIView] = [self.carImage, self.nameLabel]
    
    
    
    //MARK: - Init
    
    init (carWith : CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemPink
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        carImage.contentMode = .scaleAspectFill
        
        
        for view in subView {
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)

        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameLabel, attribute: .centerX , relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),


        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }

}

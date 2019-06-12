//
//  MenuBar.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/17/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class MenuBar : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    
    lazy var collectionView : UICollectionView =
    {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(colorLiteralRed: 0.65, green: 0.15, blue: 0.60, alpha: 0.2)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellID = "cellID"
    
    //Variable instantiated to allow the white swipe bar to move across items
    var horizontalBarViewLeftAnchor : NSLayoutConstraint?
    
    //Reference to main ViewController
    var viewController: ViewController?
    
    //Array of Cell images
    //To change images, replace strings with corresponding image assets
    let imageNames = ["uber5", "lyft1", "taxi1"]
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "cellID")
        
        //Add collectionView constraints
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        //Makes Uber tab selected upon startup
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
        //Creates white swipe bar underneath menu bar items
        //Only available on iOS 9.0 <
        if #available(iOS 9.0, *) {
            setupHorizontalSwipe()
        } else {
            // Fallback on earlier versions
        }
    }
    
    //Only available on iOS 9.0 <
    @available(iOS 9.0, *)
    private func setupHorizontalSwipe()
    {
        //Creates white bar as a UIView
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.white
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        //Constraints for white swipe bar to appear
        horizontalBarViewLeftAnchor = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarViewLeftAnchor?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //Allows call to view controller to give correct item per view controller
        viewController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(colorLiteralRed: 0.06, green: 0.02, blue: 0.07, alpha: 1.0)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell : ParentCell
{
    
    let imageView : UIImageView =
    {
        let iv = UIImageView()
        iv.image = UIImage(named: "uber1")
        return iv
    }()
    
    //Makes tab cell highlighted white
    override var isHighlighted: Bool
    {
        didSet
        {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor(colorLiteralRed: 0.06, green: 0.02, blue: 0.07, alpha: 1.0)
        }
    }
    
    //Makes tab cell remain highlighted white and selected
    override var isSelected: Bool
        {
        didSet
        {
            imageView.tintColor = isSelected ? UIColor.white : UIColor(colorLiteralRed: 0.06, green: 0.02, blue: 0.07, alpha: 1.0)
        }
    }
    
    
    override func setupViews()
    {
        super.setupViews()
        addSubview(imageView)
        
        //Constraints for imageView
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        //Constraint that centers icon to middle of cell
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

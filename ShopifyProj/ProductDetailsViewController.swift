//
//  ProductDetailsViewController.swift
//  ShopifyProj
//
//  Created by Eman on 19/02/2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    
    
    
    @IBOutlet weak var pagecontrolleroutlet: UIPageControl!
    
    
    
    
    @IBOutlet weak var productimgCollection: UICollectionView!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var loveoutlet: UIButton!
    var productimgs : [String]?
    var timer : Timer?
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        productimgs = ["2" , "3" , "4"]
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        
       
        pagecontrolleroutlet.numberOfPages = productimgs!.count
//        pagecontrolleroutlet.currentPage = 0
        reviewTable.delegate = self
        reviewTable.dataSource = self
        productimgCollection.delegate = self
        productimgCollection.dataSource = self
        reviewTable.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "reviewtablecell")
  
        
    }
    @objc func slideToNext()
    {
        if currentCellIndex < productimgs!.count-1
        {
            currentCellIndex += 1
        }
        else
        {
            currentCellIndex = 0
        }
        
        productimgCollection.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right
                                          , animated: true)
        pagecontrolleroutlet.currentPage = currentCellIndex
    }
    
    @IBAction func lovebtm(_ sender: UIButton) {
        loveoutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    
    @IBAction func seeMoreBtm(_ sender: UIButton) {
        
        
       var seemorescreen = self.storyboard?.instantiateViewController(withIdentifier: "seemore") as! SeeMoreReviewsViewController
        
        self.present(seemorescreen, animated: true)
    }
    
    
    
    
    
  
    @IBAction func addToBagbtm(_ sender: Any) {
    }
    
}
extension ProductDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productimgCollection.dequeueReusableCell(withReuseIdentifier: "imagecollectioncell", for: indexPath) as! ProductDetailsImgCollectionViewCell
              cell.productImg.image = UIImage(named: productimgs![indexPath.row])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productimgs?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.view.frame.width*0.9,height: self.view.frame.height*0.2)
       
    }
    
    
    
    
    
    
}

extension ProductDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "reviewtablecell", for: indexPath) as! ReviewTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height/4-40
    }
    
}

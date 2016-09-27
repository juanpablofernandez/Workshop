//
//  WorkshopsViewController.swift
//  Workshop
//
//  Created by Jay on 9/22/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit

class WorkshopsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Workshops", style: .plain, target: nil, action: nil)
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!, NSForegroundColorAttributeName: UIColor.white]
        tabBarController?.tabBar.tintColor = UIColor.white
        tabBarController?.tabBar.barTintColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WorkshopsViewController: UICollectionViewDataSource {
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let screenWidth = collectionView.bounds.width
//        let screenHeight = collectionView.bounds.height
//        
//        let size = CGSize.init(width: screenWidth/3, height: screenHeight/4)
//        return size
//    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        // Compute the dimension of a cell for an NxN layout with space S between
//        // cells.  Take the collection view's width, subtract (N-1)*S points for
//        // the spaces between the cells, and then divide by N to find the final
//        // dimension for the cell's width and height.
//        
//        let cellsAcross: CGFloat = 3
//        let spaceBetweenCells: CGFloat = 3
//        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//        return CGSize(width: dim, height: dim)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height);
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
}

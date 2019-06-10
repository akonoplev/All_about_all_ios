//
//  ViewController.swift
//  MVP+TDD
//
//  Created by Андрей Коноплев on 08/06/2019.
//  Copyright © 2019 Андрей Коноплев. All rights reserved.
//

import UIKit

protocol OnBoardingViewProtocol: class {
    
}

class OnBoardingVC: UIViewController, OnBoardingViewProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var closeButton: UIButton!
    
    var offset: Double = 0.0
    
    var presenter: OnBoardingPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = OnBoardingPresenter(view: self, dataSource: nil)
        registerNibs()
        setupUI()
    }
}

extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.numberOfEntities()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardingCell", for: indexPath) as! OnBoardingCell
        cell.configure(with: self.presenter.itemAt(index: indexPath.row))
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / (self.collectionView?.bounds.width)!)
        pager.currentPage = currentPage % self.presenter.numberOfEntities()
        
        if pager.currentPage == self.presenter.numberOfEntities() - 1 {
            closeButton.isHidden = false
        }
    }
}

extension OnBoardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView?.frame.width ?? 0 , height: self.collectionView?.frame.height ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
}


extension OnBoardingVC {
    
    @IBAction func tapToFinish(_ sender: Any) {
        print("pizdec")
    }
    
    func setupUI()-> Void {
        closeButton.isHidden = true
        self.pager.numberOfPages = self.presenter.numberOfEntities()
    }
    
    func registerNibs()-> Void {
        let nib = UINib(nibName: "OnBoardingCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "onBoardingCell")
    }
}

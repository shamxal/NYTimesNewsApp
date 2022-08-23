//
//  ArchiveController.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 23.08.22.
//

import UIKit

class ArchiveController: UIViewController {

    @IBOutlet private weak var collection: UICollectionView!
    
    let viewModel = ArchiveViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    fileprivate func setup() {
        collection.register(UINib(nibName: "\(ArchiveCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ArchiveCell.self)")
    }
    
    
}

extension ArchiveController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ArchiveCell.self)", for: indexPath) as! ArchiveCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 150)
    }
    //TODO: sizeForRowAtItem
}

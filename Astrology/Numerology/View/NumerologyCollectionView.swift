//
//  NumerologyCollectionView.swift
//  Astrology
//
//  Created by mac on 31.12.2022.
//

import UIKit

class NumerologyCollectionView: UICollectionView {
    
    init() {
        let layout = NumerologyCollectionViewLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.delegate = self
        
        backgroundColor = .clear
        
        delegate = self
        dataSource = self
        
        let cellClass = NumerologyCollectionViewCell.self
        let identifier = String(describing: NumerologyCollectionViewCell.self)
        
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NumerologyCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, NumerologyCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: NumerologyCollectionViewCell.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? NumerologyCollectionViewCell else {
            return NumerologyCollectionViewCell()
        }
        
        cell.setup(tiitle: "Number of day", number: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return (indexPath.item) % 3 == 0 ? 200 : 300
        
    }
}

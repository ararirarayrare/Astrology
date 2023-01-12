//
//  MainContentViewNumerologyCollectionView.swift
//  Astrology
//
//  Created by mac on 11.01.2023.
//

import UIKit

class MainContentViewNumerologyCollectionView: UICollectionView {
    
    let numbers: [Numerology]
        
    var coordinator: MainCoordinator?
    
    init(numbers: [Numerology]) {
        self.numbers = numbers
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        let cellClass = MainContentViewNumerologyCollectionViewCell.self
        let identifier = String(describing: cellClass)
        
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainContentViewNumerologyCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: MainContentViewNumerologyCollectionViewCell.self)
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainContentViewNumerologyCollectionViewCell else {
            return MainContentViewNumerologyCollectionViewCell()
        }
        
        let numerologyType = numbers[indexPath.item]
        
        cell.setup(withTitle: numerologyType.title,
                   number: numerologyType.number) { [weak self] in
            
            self?.coordinator?.eventOccured(.numerology(numerologyType))
        }
        
        cell.imageView.image = UIImage(named: "number-bg-\(indexPath.item)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: bounds.width * 0.75,
                      height: bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}

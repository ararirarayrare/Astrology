//
//  MainTableViewHeaderCollectionView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainTableViewHeaderCollectionView: UICollectionView {
    
    let data = [
        "yesterday",
        "today",
        "tomorrow",
        "weekly",
        "monthly",
        "yearly"
    ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140.0, height: 40.0)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        
        delegate = self
        dataSource = self
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        let cellClass = MainTableViewHeaderCollectionViewCell.self
        let identifier = String(describing: cellClass)
        
        register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTableViewHeaderCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: MainTableViewHeaderCollectionViewCell.self)
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainTableViewHeaderCollectionViewCell else {
            return MainTableViewHeaderCollectionViewCell()
        }
        
        
        cell.setup(title: data[indexPath.item])
        
        
        return cell
    }
}

class MainTableViewHeaderCollectionViewCell: UICollectionViewCell {
    
    func setup(title: String) {
        
        backgroundColor = .systemBlue.withAlphaComponent(0.25)
        
        layer.cornerRadius = 20
        
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 0, width: 100, height: 40)
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.text = title
        
        label.textAlignment = .center
        
        addSubview(label)
    }
    
}

//
//  TableView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

protocol MainTableViewScrollDelegate: AnyObject {
    func tableView(_ tableView: MainTableView, shouldSnap: Bool)
}

class MainTableView: UITableView {
    
    weak var scrollDelegate: MainTableViewScrollDelegate?

    init() {
        super.init(frame: .zero, style: .plain)

        backgroundColor = .clear

        allowsSelection = false

        delegate = self
        dataSource = self
        
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension

        let cellClass = MainTableViewCell.self
        let identifier = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: identifier)
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        if y >= 15 {
            scrollDelegate?.tableView(self, shouldSnap: true)
        }
        
        if y <= -50 {
            scrollDelegate?.tableView(self, shouldSnap: false)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: MainTableViewCell.self)
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? MainTableViewCell else {
            return MainTableViewCell()
        }
        
        cell.setup(index: indexPath.row)
        
        return cell
    }
}

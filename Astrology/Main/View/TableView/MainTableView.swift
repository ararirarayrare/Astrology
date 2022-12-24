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
    
    let data = [
        "This is a good day for quiet contemplation, Scorpio. You may have worried about finances lately, but there's no longer any need to concern yourself.",
        
        "All signs indicate that your financial fortunes are about to change.",
        
        "You've been working hard and should reap some rewards. Today's aspects suggest that you will. Enjoy your newfound peace of mind, but don't go out and use the credit cards in celebration!\nGet to your authentic self with the guidance of a psychic advisor. Click here to get the 1st 3 minutes of your reading free!",
        
        "The Magician Tarot card represents someone at the beginning of their journey. The path is new, but they have no fear. They have all the tools they need.",
        
        "The Magician Tarot card represents someone at the beginning of their journey. The path is new, but they have no fear. They have all the tools they need.",
        
        "The Magician holds..."
    ]

    init() {
        super.init(frame: .zero, style: .plain)

        backgroundColor = .clear

        allowsSelection = false

        delegate = self
        dataSource = self
        
        separatorColor = .clear
        
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension

        let cellClass = MainTableViewCell.self
        let identifier = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: identifier)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.setNeedsDisplay()
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
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: MainTableViewCell.self)
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? MainTableViewCell else {
            return MainTableViewCell()
        }
        
        cell.setup(text: data[indexPath.row])
        
        return cell
    }
}

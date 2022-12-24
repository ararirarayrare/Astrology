//
//  ViewController.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainViewController: ViewController {
    
    private let headerView: MainHeaderView = {
        let headerView = MainHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let infoView: MainInfoView = {
        let infoView = MainInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
        return infoView
    }()
    
    private let tableViewHeader: MainTableViewHeader = {
        let tableViewHeader = MainTableViewHeader()
        tableViewHeader.translatesAutoresizingMaskIntoConstraints = false
        return tableViewHeader
    }()
    
    private let tableView: MainTableView = {
        let tableView = MainTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .blue.withAlphaComponent(0.1)
        
        
        tableView.scrollDelegate = self

        layout()
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.insertSubview(infoView, belowSubview: headerView)
        view.insertSubview(tableView, belowSubview: headerView)
        view.insertSubview(tableViewHeader, belowSubview: headerView)
        
        let infoViewTopConstraint = infoView.topAnchor.constraint(equalTo: view.topAnchor)
        infoView.topConstraint = infoViewTopConstraint
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            
            
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 400),
            infoViewTopConstraint,
            
            
            tableViewHeader.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            tableViewHeader.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableViewHeader.topAnchor.constraint(equalTo: infoView.bottomAnchor,
                                                 constant: 8),
            tableViewHeader.heightAnchor.constraint(equalToConstant: 40),
            
            
            tableView.topAnchor.constraint(equalTo: tableViewHeader.bottomAnchor,
                                          constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension MainViewController: MainTableViewScrollDelegate {
    func tableView(_ tableView: MainTableView, shouldSnap: Bool) {
        
        guard !infoView.isAnimating else {
            return
        }

        infoView.isAnimating = true

        let neededConstant = shouldSnap ? -(infoView.bounds.height - headerView.bounds.height) : 0
        let neededAlpha = shouldSnap ? 0.75 : 0

        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25,
                                                       delay: 0,
                                                       options: .curveLinear) {
            self.infoView.topConstraint?.constant = neededConstant
            self.infoView.blurEffectView.alpha = neededAlpha
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.infoView.isAnimating = false
        }
    }
}

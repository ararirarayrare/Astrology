//
//  MainContentView.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

class MainContentView: UIView {
    
    private let essentialView: MainContentViewEssential = {
        let view = MainContentViewEssential(parameters: [
            "Love" : 0.85,
            "Money" : 0.25,
            "Career" : 0.9
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let numerologyView: MainContentViewNumerology = {
        let view = MainContentViewNumerology()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let predictionView: MainContentViewPredictionToday = {
        let prediction = "You've been working hard and should reap some rewards. Today's aspects suggest that you will. Enjoy your newfound peace of mind, but don't go out and use the credit cards in celebration!\nGet to your authentic self with the guidance of a psychic advisor. Click here to get the 1st 3 minutes of your reading free!"
        
        let view = MainContentViewPredictionToday(prediction: prediction)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let lunarCalendarView: MainContentViewLunarCalendar = {
        let today = Date()
        
        let currentPhase = MoonModel(date: today, phase: .forDate(today))
        
        let nextPhase1 = MoonModel.withNextPhase(fromDate: today)
        let nextPhase2 = MoonModel.withNextPhase(fromDate: nextPhase1.date)
        let nextPhase3 = MoonModel.withNextPhase(fromDate: nextPhase2.date)
        let nextPhase4 = MoonModel.withNextPhase(fromDate: nextPhase3.date)
        
        let nextPhases = [
            nextPhase1,
            nextPhase2,
            nextPhase3,
            nextPhase4
        ]
        
        let view = MainContentViewLunarCalendar(currentPhase: currentPhase,
                                                nextPhases: nextPhases)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
    private func layout() {
        addSubview(essentialView)
        addSubview(numerologyView)
        addSubview(predictionView)
        addSubview(lunarCalendarView)
        
        NSLayoutConstraint.activate([
            essentialView.leadingAnchor.constraint(equalTo: leadingAnchor),
            essentialView.trailingAnchor.constraint(equalTo: trailingAnchor),
            essentialView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 20),
            
            
            numerologyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numerologyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            numerologyView.topAnchor.constraint(equalTo: essentialView.bottomAnchor,
                                                constant: 20),
            numerologyView.heightAnchor.constraint(equalToConstant: 80.0),
            
            
            predictionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            predictionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            predictionView.topAnchor.constraint(equalTo: numerologyView.bottomAnchor,
                                                constant: 20),
            
            
            lunarCalendarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lunarCalendarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lunarCalendarView.topAnchor.constraint(equalTo: predictionView.bottomAnchor,
                                                   constant: 20),
            lunarCalendarView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                      constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

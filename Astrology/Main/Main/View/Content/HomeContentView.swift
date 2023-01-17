//
//  HomeContentView.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

final class HomeContentView: UIView {
    
    private let essentialView: HomeContentViewEssential = {
        let view = HomeContentViewEssential(parameters: [
            "Love" : 0.85,
            "Money" : 0.25,
            "Career" : 0.9
        ])
        
        return view
    }()
    
    private lazy var numerologyView: HomeContentViewNumerology = {
        let view = HomeContentViewNumerology(coordinator: self.coordinator)
        
        return view
    }()
    
    private let todayPredictionView: HomeContentViewPrediction = {
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(string: "Prediction for ")
        )
        attributedString.append(
            NSAttributedString(
                string: "today ",
                attributes: [
                    .foregroundColor : UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
                ]
            )
        )
        attributedString.append(
            NSAttributedString(string: ":")
        )
        
        
        let prediction = "You've been working hard and should reap some rewards. Today's aspects suggest that you will. Enjoy your newfound peace of mind, but don't go out and use the credit cards in celebration!\n\nGet to your authentic self with the guidance of a psychic advisor. Click here to get the 1st 3 minutes of your reading free!"
        
        let view = HomeContentViewPrediction(attributedTitle: attributedString, prediction: prediction)
        
        return view
    }()
    
    private let moonCalendarView: HomeContentViewMoonCalendar = {
        let today = Date()
        
        let currentPhase = Moon(date: today, phase: .forDate(today))
        
        let nextPhase1 = Moon.withNextPhase(fromDate: today)
        let nextPhase2 = Moon.withNextPhase(fromDate: nextPhase1.date)
        let nextPhase3 = Moon.withNextPhase(fromDate: nextPhase2.date)
        let nextPhase4 = Moon.withNextPhase(fromDate: nextPhase3.date)
        
        let nextPhases = [
            nextPhase1,
            nextPhase2,
            nextPhase3,
            nextPhase4
        ]
        
        let view = HomeContentViewMoonCalendar(currentPhase: currentPhase,
                                                nextPhases: nextPhases)
        return view
    }()
    
    private let biorythmView: HomeContentViewBiorythm = {        
        let view = HomeContentViewBiorythm()
        
        return view
    }()
    
    private lazy var messageView: HomeContentViewMessage = {
        let messageView = HomeContentViewMessage(coordinator: self.coordinator)
        
        return messageView
    }()
    
    private let yearlyPredictionView: HomeContentViewPrediction = {
        let title = "2023 Year horoscope:"
        let prediction = "2023 for Scorpio zodiac sign shall go all relaxing and soothing. From the beginning, planet Jupiter will make a positive move in your natal chart. Thus, you would store luck in your pockets and enjoy a comfortable living. All your hindrances will wear off, and you will move forward in life with ease. Later with Saturn in Aquarius zodiac sign, some delay in work would come. Shackles will be there. But the guts to break them shall approach you in the latter half of the year. \n\n For money matters, predicts the Scorpio Yearly Horoscope 2022, you will easily gain financial resources in the first half of the year. Thanks to the planet Jupiter, which will transit in your eleventh house and Virgo sign. The eleventh house is the house of wealth and the presence of Jupiter will give good results. Thus, you enjoy wealth. Further, there may be some expenditure in the last quarter of the year. So manage it carefully. Are you planning to invest? Plan it during the transit of Jupiter in the house of wealth."
        
        let view = HomeContentViewPrediction(title: title, prediction: prediction)
        
        return view
    }()
    
    
    let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        super.init(frame: .zero)
        
        layout()
    }
    
    private func layout() {
        addSubview(essentialView)
        addSubview(numerologyView)
        addSubview(todayPredictionView)
        addSubview(moonCalendarView)
        addSubview(biorythmView)
//        addSubview(messageView)   
        addSubview(yearlyPredictionView)
        
        NSLayoutConstraint.activate([
            todayPredictionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                         constant: 20),
            todayPredictionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: -20),
            todayPredictionView.topAnchor.constraint(equalTo: topAnchor,
                                                     constant: 24),
            
            
            essentialView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 20),
            essentialView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -20),
            essentialView.topAnchor.constraint(equalTo: todayPredictionView.bottomAnchor,
                                               constant: 20),
            
            
            numerologyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numerologyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            numerologyView.topAnchor.constraint(equalTo: essentialView.bottomAnchor,
                                                constant: 32),
            
            
            moonCalendarView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                       constant: 20),
            moonCalendarView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                        constant: -20),
            moonCalendarView.topAnchor.constraint(equalTo: numerologyView.bottomAnchor,
                                                   constant: 32),
            
            biorythmView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: 20),
            biorythmView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -20),
            biorythmView.topAnchor.constraint(equalTo: moonCalendarView.bottomAnchor,
                                              constant: 32),
            
            
//            messageView.leadingAnchor.constraint(equalTo: leadingAnchor,
//                                                 constant: 20),
//            messageView.trailingAnchor.constraint(equalTo: trailingAnchor,
//                                                  constant: -20),
//            messageView.topAnchor.constraint(equalTo: biorythmView.bottomAnchor,
//                                             constant: 32),
            
            
            yearlyPredictionView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                          constant: 20),
            yearlyPredictionView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                           constant: -20),
            yearlyPredictionView.topAnchor.constraint(equalTo: biorythmView.bottomAnchor,
                                                      constant: 20),
            yearlyPredictionView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                         constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeContentViewItem: UIView {
    
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layout() { }
    
}

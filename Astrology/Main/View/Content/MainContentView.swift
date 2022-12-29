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
        
        return view
    }()
    
    private let numerologyView: MainContentViewNumerology = {
        let view = MainContentViewNumerology()
        
        return view
    }()
    
    private let todayPredictionView: MainContentViewPrediction = {
        let title = "Prediction for today: "
        let prediction = "You've been working hard and should reap some rewards. Today's aspects suggest that you will. Enjoy your newfound peace of mind, but don't go out and use the credit cards in celebration!\nGet to your authentic self with the guidance of a psychic advisor. Click here to get the 1st 3 minutes of your reading free!"
        
        let view = MainContentViewPrediction(title: title, prediction: prediction)
        
        return view
    }()
    
    private let lunarCalendarView: MainContentViewLunarCalendar = {
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
        
        let view = MainContentViewLunarCalendar(currentPhase: currentPhase,
                                                nextPhases: nextPhases)
        return view
    }()
    
    private let biorythmView: MainContentViewBiorythm = {
        let biorythms: [Biorythm] = [
            .emotional(value: 0.5),
            .physical(value: 0.86),
            .intellectual(value: 0.77)
        ]
        
        let view = MainContentViewBiorythm(biorythms: biorythms)
        
        return view
    }()
    
    private let messageView: MainContentViewMessage = {
        let messageView = MainContentViewMessage()

        return messageView
    }()
    
    private let yearlyPredictionView: MainContentViewPrediction = {
        let title = "2023 Year horoscope:"
        let prediction = "2023 for Scorpio zodiac sign shall go all relaxing and soothing. From the beginning, planet Jupiter will make a positive move in your natal chart. Thus, you would store luck in your pockets and enjoy a comfortable living. All your hindrances will wear off, and you will move forward in life with ease. Later with Saturn in Aquarius zodiac sign, some delay in work would come. Shackles will be there. But the guts to break them shall approach you in the latter half of the year. \n\n For money matters, predicts the Scorpio Yearly Horoscope 2022, you will easily gain financial resources in the first half of the year. Thanks to the planet Jupiter, which will transit in your eleventh house and Virgo sign. The eleventh house is the house of wealth and the presence of Jupiter will give good results. Thus, you enjoy wealth. Further, there may be some expenditure in the last quarter of the year. So manage it carefully. Are you planning to invest? Plan it during the transit of Jupiter in the house of wealth."
        
        let view = MainContentViewPrediction(title: title, prediction: prediction)
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
        addSubview(todayPredictionView)
        addSubview(lunarCalendarView)
        addSubview(biorythmView)
        addSubview(messageView)
        addSubview(yearlyPredictionView)
        
        NSLayoutConstraint.activate([
            essentialView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 20),
            essentialView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -20),
            essentialView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 20),
            
            
            numerologyView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 20),
            numerologyView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -20),
            numerologyView.topAnchor.constraint(equalTo: essentialView.bottomAnchor,
                                                constant: 20),
            numerologyView.heightAnchor.constraint(equalToConstant: 80.0),
            
            
            todayPredictionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            todayPredictionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            todayPredictionView.topAnchor.constraint(equalTo: numerologyView.bottomAnchor,
                                                constant: 20),
            
            
            lunarCalendarView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 20),
            lunarCalendarView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -20),
            lunarCalendarView.topAnchor.constraint(equalTo: todayPredictionView.bottomAnchor,
                                                   constant: 20),
            
            biorythmView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: 20),
            biorythmView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -20),
            biorythmView.topAnchor.constraint(equalTo: lunarCalendarView.bottomAnchor,
                                              constant: 20),
            biorythmView.heightAnchor.constraint(equalToConstant: 240),

            
            messageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            messageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                  constant: -20),
            messageView.topAnchor.constraint(equalTo: biorythmView.bottomAnchor,
                                             constant: 20),

            
            yearlyPredictionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yearlyPredictionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            yearlyPredictionView.topAnchor.constraint(equalTo: messageView.bottomAnchor,
                                                constant: 20),
            yearlyPredictionView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                         constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainContentViewItem: UIView {
    
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

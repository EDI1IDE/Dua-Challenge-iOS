//
//  Fixture.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class Fixture {
    
    let homeTeam: Team
    let awayTeam: Team
    
    init(homeTeam: Team, awayTeam: Team) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
    
    //MARK: - Methods
    func playMatch() {
        //Random goals per team
        let homeGoals = Int.random(in: 0...5)
        let awayGoals = Int.random(in: 0...5)
        
        //Goals scored
        homeTeam.goalsScored += homeGoals
        awayTeam.goalsScored += awayGoals
        
        //Goals received
        homeTeam.goalsReceived += awayGoals
        awayTeam.goalsReceived += homeGoals
        
        //Match won
        homeTeam.matchesWon += (homeGoals > awayGoals) ? 1 : 0
        awayTeam.matchesWon += (awayGoals > homeGoals) ? 1 : 0
        
        //Match lost
        homeTeam.matchesLost += (homeGoals < awayGoals) ? 1 : 0
        awayTeam.matchesLost += (awayGoals < homeGoals) ? 1 : 0
        
        //Match draw
        homeTeam.matchesDraw += (homeGoals == awayGoals) ? 1 : 0
        awayTeam.matchesDraw += (homeGoals == awayGoals) ? 1 : 0
    }
    
}

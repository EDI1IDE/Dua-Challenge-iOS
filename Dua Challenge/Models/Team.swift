//
//  Team.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class Team {
    
    //MARK: - Properties
    let id: String
    let name: String
    let logo: UIImage?
    let city: String
    let coach: String
    
    var matchesWon: Int = 0
    var matchesDraw: Int = 0
    var matchesLost: Int = 0
    var goalsScored: Int = 0
    var goalsReceived: Int = 0
    
    //MARK: - Init
    init(name: String, logo: UIImage?, city: String, coach: String) {
        self.id = UUID().uuidString
        self.name = name
        self.logo = logo
        self.city = city
        self.coach = coach
    }
    
    //MARK: - Computed properties
    var points: Int {
        let points = (3 * matchesWon) + matchesDraw
        return points
    }
    
    var goalDifference: Int {
        return goalsScored - goalsReceived
    }
    
}

//
//  Generator.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class Generator {
    
    //MARK: - Team Names
    static let teamNames: [String] = [
        "Skënderbeu", "Shkëndija", "Teuta", "Luftëtari",
        "Prishtina", "Gjilani", "Ferizaj", "Vëllaznimi",
        "Flamurtari", "Zjarri", "Ilirida", "Kruja",
        "Butrinti", "Ulkini", "Drini", "Dardania",
        "Arbëria", "Malësia", "Albulena", "Dielli",
        "Hëna", "Joni", "Adriatiku", "Ardiana"
    ]
    
    //MARK: - Team Cities
    static let teamCities: [String] = [
        "Gjilani", "Prishtina", "Ferizaji", "Gjakova",
        "Prizreni", "Albaniku", "Dardana", "Drenasi",
        "Peja", "Deçani", "Istogu", "Vitia",
        "Rahoveci", "Shkodra", "Durrësi", "Korça",
        "Lezha", "Tirana", "Vlora", "Elbasani",
        "Manastiri", "Tetova", "Shkupi", "Ulqini"
    ]
    
    //MARK: - Team Coaches
    static let teamCoaches: [String] = [
        "Hektor Gashi", "Ardian Berisha", "Luan Krasniqi", "Malësor Thaçi",
        "Dardan Flamurtari", "Taulant Xhaka", "Granit Xhaka", "Lorik Cana",
        "Ariot Shpataj", "Urtina Malaj", "Thesprote Mrikaj", "Krenare Dukagjini",
        "Meriton Artimaj", "Bora Labaj", "Labinot Rremaj", "Milot Kurtaj",
        "Nderon Fisnikaj", "Mbret Rokaj", "Shpat Sopi", "Lumturie Kreshta"
    ]
    
    //MARK: - Generate Teams
    static func generateTeams() -> [Team] {
        var teams: [Team] = []
        
        //Shuffle team infos
        let shuffledTeamNames = teamNames.shuffled()
        let shuffledTeamCities = teamCities.shuffled()
        let shuffledTeamCoached = teamCoaches.shuffled()
        
        for i in 0...19 {
            //Added checks in case of adding more teams
            let logo = UIImage.teamLogo(number: i)
            let name = "K.F. \(shuffledTeamNames.indices.contains(i) ? shuffledTeamNames[i] : "Bora")"
            let city = shuffledTeamCities.indices.contains(i) ? shuffledTeamCities[i] : "Gjilan"
            let coach = shuffledTeamCoached.indices.contains(i) ? shuffledTeamCoached[i] : "Kastriot Shkëmbi"
            
            teams.append(Team(name: name, logo: logo, city: city, coach: coach))
        }
       return teams
    }
    
    //MARK: - Generate Fixtures
    static func generateFixtures(teams: [Team]) -> [Fixture] {
        var fixtures: [Fixture] = []
        
        //The (i + 1) is used to avoid generating duplicates
        for i in 0..<teams.count {
            for j in (i + 1)..<teams.count {
                let homeTeam = teams[i]
                let awayTeam = teams[j]
                let homeFixture = Fixture(homeTeam: homeTeam, awayTeam: awayTeam)
                let awayFixture = Fixture(homeTeam: awayTeam, awayTeam: homeTeam)
                fixtures.append(contentsOf: [homeFixture, awayFixture])
            }
        }
        //We shuffle the fixtures again, just in case🙂
        return fixtures.shuffled()
    }
}


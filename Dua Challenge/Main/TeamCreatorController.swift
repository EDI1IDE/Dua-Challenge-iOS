//
//  TeamCreatorController.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class TeamCreatorController: Controller {
    
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var generateStandingsButton: UIButton!
    
    var teams: [Team] = []
    var fixtures: [Fixture] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    private func setupUI() {
        title = "Create League Standings"
        
        //Change icon for devices that aren't running iOS 16+
        if #available(iOS 16, *) {}
        else { ballImageView.image = .oldBall }
    }
    
    private func generateStandings() {
        teams = Generator.generateTeams()
        fixtures = Generator.generateFixtures(teams: teams)
        fixtures.forEach { fixture in
            fixture.playMatch()
        }
        //Sort teams in a descending order
        teams.sort(by: {$0.points > $1.points})
    }
    
    //MARK: - IBActions
    @IBAction func generateStandingsButtonPressed(_ sender: UIButton) {
        generateStandings()
        push(TeamStandingsController.create(teams: teams, fixtures: fixtures))
    }
    
}

//MARK: - Navigation
extension TeamCreatorController {
    static func create() -> TeamCreatorController {
        let controller = UIStoryboard.main.instantiate(TeamCreatorController.self)
        return controller
    }
}

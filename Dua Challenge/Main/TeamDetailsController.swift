//
//  TeamDetailsController.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class TeamDetailsController: Controller {
    
    //MARK: - IBOutlets
    @IBOutlet weak var teamDetailsStackView: UIStackView!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var coachLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var matchesWonLabel: UILabel!
    @IBOutlet weak var matchesDrawLabel: UILabel!
    @IBOutlet weak var matchesLostLabel: UILabel!
    
    @IBOutlet weak var goalsScoredLabel: UILabel!
    @IBOutlet weak var goalsReceivedLabel: UILabel!
    @IBOutlet weak var goalDifferenceLabel: UILabel!
    
    var item: Team!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    private func setupUI() {
        title = "Team Details"
        
        teamNameLabel.text          = item.name
        cityLabel.text              = item.city
        coachLabel.text             = item.coach
        pointsLabel.text            = "\(item.points)"
        matchesWonLabel.text        = "\(item.matchesWon)"
        matchesDrawLabel.text       = "\(item.matchesDraw)"
        matchesLostLabel.text       = "\(item.matchesLost)"
        goalsScoredLabel.text       = "\(item.goalsScored)"
        goalsReceivedLabel.text     = "\(item.goalsReceived)"
        goalDifferenceLabel.text    = "\(item.goalDifference)"
        
        teamImageView.image = item.logo?.resizeImage(size: 400, quality: 1)
        teamDetailsStackView.roundCorner(corner: .top, radius: 25)
        teamDetailsStackView.dropShadow(
            shadowPath: UIBezierPath(rect: CGRect(
                x: 0, y: -4, width: teamDetailsStackView.bounds.width, height: 4)
            ).cgPath
        )
    }
    
    //When transitioning between light and dark mode, the described changes are implemented(refreshed).
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        teamDetailsStackView.dropShadow(
            shadowPath: UIBezierPath(rect: CGRect(
                x: 0, y: -4, width: teamDetailsStackView.bounds.width, height: 4)
            ).cgPath
        )
    }
}

//MARK: - Navigation
extension TeamDetailsController {
    static func create(team: Team) -> TeamDetailsController {
        let controller = UIStoryboard.main.instantiate(TeamDetailsController.self)
        controller.item = team
        return controller
    }
}

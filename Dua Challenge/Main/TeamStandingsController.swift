//
//  TeamStandingsController.swift
//  Dua Challenge
//
//  Created by Muhamed Zahiri on 1.6.23.
//

import UIKit

class TeamStandingsController: Controller {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teams: [Team] = []
    var fixtures: [Fixture] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerTableView()
    }
    
    //MARK: - Methods
    private func setupUI() {
        title = "Team Standings"
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TeamTCell.self)
        tableView.registerHeaderFooter(TeamTHeader.self)
        tableView.reloadData()
    }
    
}

//MARK: - TableView Delegates
extension TeamStandingsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(TeamTCell.self, for: indexPath)
        cell.item = teams[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        push(TeamDetailsController.create(team: team))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //HeaderView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueHeaderFooter(TeamTHeader.self)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}

//MARK: - Navigation
extension TeamStandingsController {
    static func create(teams: [Team], fixtures: [Fixture]) -> TeamStandingsController {
        let controller = UIStoryboard.main.instantiate(TeamStandingsController.self)
        controller.teams = teams
        controller.fixtures = fixtures
        return controller
    }
}

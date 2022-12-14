import UIKit

protocol TeamSelectionDelegate {
    func didTapTeam(name: String, imageName: String)
}

final class TeamsViewController: UIViewController {
    enum Section {
        case first
    }
    
    private let teams = Team.dataSource
    private var dataSource: UITableViewDiffableDataSource<Section, Team>?
    var teamSelectionDelegate: TeamSelectionDelegate?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        applyDataSource()
        setupViews()
    }
    
    // MARK: - Views
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.register(TeamCell.self, forCellReuseIdentifier: TeamCell.identifier)
        table.alwaysBounceVertical = true
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Constraints
    private func setupViews() {
        title = Strings.TeamsViewController.navigationTitle

        view.addSubview(tableView)
        tableView.frame = view.bounds
        
    }
    
    // MARK: - Methods
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView,
                                                   cellProvider: { tableView, indexPath, team -> TeamCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.identifier, for: indexPath) as? TeamCell else {
                fatalError("Could not dequeue cell")
            }
            cell.setupCell(name: team.name, imageName: team.logoName)
            return cell
        })
    }
    
    private func applyDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Team>()
        snapshot.appendSections([.first])
        snapshot.appendItems(teams)
        dataSource?.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}

// MARK: - Delegates
extension TeamsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        teamSelectionDelegate?.didTapTeam(name: team.name, imageName: team.logoName)
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true)
    }
}

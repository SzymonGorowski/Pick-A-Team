import UIKit

final class MainViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Views
    lazy private var selectTeamButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.MainViewController.selectTeamButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(selectTeamButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var infoLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = Strings.MainViewController.infoLabelTitle
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    lazy private var teamNameLabel: UILabel = {
        let label = PaddingLabel()
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.padding(10, 10, 10, 10)
        return label
    }()
    
    lazy private var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()
    
    lazy private var teamStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoLabel, teamLogoImageView, teamNameLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.opacity = 0
        return stackView
    }()
    
    // MARK: - Constraints
    private func setupViews() {
        view.backgroundColor = .systemBackground
        title = Strings.MainViewController.navigationTitle
        
        view.addSubview(selectTeamButton)
        selectTeamButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        selectTeamButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        selectTeamButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        selectTeamButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true

        view.addSubview(teamStackView)
        teamStackView.bottomAnchor.constraint(equalTo: selectTeamButton.topAnchor, constant: -50).isActive = true
        teamStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    // MARK: - Methods
    @objc private func selectTeamButtonTapped() {
        let teamsVC = TeamsViewController()
        teamsVC.teamSelectionDelegate = self
        let navVC = UINavigationController(rootViewController: teamsVC)
        present(navVC, animated: true)
    }
}

// MARK: - Delegates
extension MainViewController: TeamSelectionDelegate {
    func didTapTeam(name: String, imageName: String) {
        teamLogoImageView.image = UIImage(named: imageName)
        teamNameLabel.text = name
        teamStackView.layer.opacity = 1
    }
}

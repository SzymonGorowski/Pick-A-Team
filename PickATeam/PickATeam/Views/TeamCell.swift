import UIKit

final class TeamCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    lazy private var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }()
    
    lazy private var teamNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Constraints
    func setupViews() {
        self.backgroundColor = .clear
        
        contentView.addSubview(teamLogoImageView)
        teamLogoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        teamLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(teamNameLabel)
        teamNameLabel.leadingAnchor.constraint(equalTo: teamLogoImageView.trailingAnchor, constant: 20).isActive = true
        teamNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func setupCell(name: String, imageName: String) {
        teamLogoImageView.image = UIImage(named: imageName)
        teamNameLabel.text = name
    }
}

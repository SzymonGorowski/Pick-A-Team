import Foundation

struct Strings {
    enum MainViewController {
        static let navigationTitle: String = NSLocalizedString("Predict Winner", comment: "")
        static let infoLabelTitle: String = NSLocalizedString("You picked:", comment: "")
        static let selectTeamButtonTitle: String = NSLocalizedString("Which team will win NBA in 2023?", comment: "")
    }
    
    enum TeamsViewController {
        static let navigationTitle: String = NSLocalizedString("Pick your team!", comment: "")
    }
}

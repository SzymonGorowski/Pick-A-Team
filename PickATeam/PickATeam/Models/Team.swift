import Foundation

struct Team: Hashable {
    let name: String
    let logoName: String
    
    static let dataSource: [Team] = [
        Team(name: "Los Angeles Lakers", logoName: "lakers"),
        Team(name: "Golden State Warriors", logoName: "gsw"),
        Team(name: "Boston Celtics", logoName: "celtics"),
        Team(name: "Phoenix Suns", logoName: "suns"),
        Team(name: "Chicago Bulls", logoName: "bulls"),
        Team(name: "Milwaukee Bucks", logoName: "bucks"),
        Team(name: "Philadelphia 76ers", logoName: "philly"),
    ]
}

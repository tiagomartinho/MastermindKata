class Mastermind {

    let colors: [String]

    init(colors: [String]) {
        self.colors = colors
    }

    func evaluate(guess: [String]) -> [Int] {
        let wellPlaced = zip(colors, guess)
            .reduce(0) { (result, combined) -> Int in
                let wellPlacedColor = (combined.0 == combined.1 ? 1 : 0)
                return result + wellPlacedColor
        }
        let correctColors = Set(guess).intersection(Set(colors)).count
        return [wellPlaced, correctColors - wellPlaced]
    }
}

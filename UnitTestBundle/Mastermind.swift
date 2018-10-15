class Mastermind {

    let colors: [Color]

    init(colors: [Color]) {
        self.colors = colors
    }

    func evaluate(guess: [Color]) -> Result {
        let wellPlaced = zip(colors, guess)
            .reduce(0) { (result, combined) -> Int in
                let wellPlacedColor = (combined.0 == combined.1 ? 1 : 0)
                return result + wellPlacedColor
        }
        let correctColors = Set(guess).intersection(Set(colors)).count
        let misPlaced = correctColors - wellPlaced
        return Result(wellPlacedColors: wellPlaced, misplacedColors: misPlaced)
    }
}

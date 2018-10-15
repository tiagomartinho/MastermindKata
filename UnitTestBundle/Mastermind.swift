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
        let misplaced = colors.reduce(0) { result, color -> Int in
            let guessContainsColor = (Set(guess).contains(color) ? 1 : 0)
            return result + guessContainsColor
        } - wellPlaced
        return Result(wellPlacedColors: wellPlaced,
                      misplacedColors: misplaced)
    }
}

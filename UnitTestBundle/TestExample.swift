import XCTest

class TestMasterMind: XCTestCase {

    func testWellPlacedColor() {
        let mastermind = Mastermind(colors: ["blue"])

        let result = mastermind.evaluate(guess: ["blue"])

        XCTAssertEqual([1, 0], result)
    }

    func testNotWellPlacedColor() {
        let mastermind = Mastermind(colors: ["blue"])

        let result = mastermind.evaluate(guess: ["red"])

        XCTAssertEqual([0, 0], result)
    }

    func testWellPlacedColors() {
        let mastermind = Mastermind(colors: ["blue", "red"])

        let result = mastermind.evaluate(guess: ["blue", "red"])

        XCTAssertEqual([2, 0], result)
    }

    func testCorrectButNotWellPlacedColors() {
        let mastermind = Mastermind(colors: ["red", "blue"])

        let result = mastermind.evaluate(guess: ["blue", "red"])

        XCTAssertEqual([0, 2], result)
    }
}

class Mastermind {

    let colors: [String]

    init(colors: [String]) {
        self.colors = colors
    }

    func evaluate(guess: [String]) -> [Int] {
        let wellPlaced = guess == colors ? guess.count : 0
        let correctColors = Set(guess) == Set(colors) ? guess.count : 0
        return [wellPlaced, correctColors - wellPlaced]
    }
}

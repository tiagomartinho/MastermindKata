import XCTest

class TestMasterMind: XCTestCase {

    func testWellPlacedSingleColor() {
        let mastermind = Mastermind(colors: ["blue"])

        let result = mastermind.evaluate(guess: ["blue"])

        XCTAssertEqual([1, 0], result)
    }

    func testNotWellPlacedSingleColor() {
        let mastermind = Mastermind(colors: ["blue"])

        let result = mastermind.evaluate(guess: ["red"])

        XCTAssertEqual([0, 0], result)
    }
}

class Mastermind {

    let colors: [String]

    init(colors: [String]) {
        self.colors = colors
    }

    func evaluate(guess: [String]) -> [Int] {
        let wellPlaced = guess == colors ? 1 : 0
        return [wellPlaced, 0]
    }
}

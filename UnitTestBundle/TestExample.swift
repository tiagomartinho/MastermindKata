import XCTest

class TestMasterMind: XCTestCase {

    func testWellPlacedSingleColor() {
        let mastermind = Mastermind(colors: ["blue"])

        let result = mastermind.evaluate(guess: ["blue"])

        XCTAssertEqual([1,0], result)
    }
}

class Mastermind {

    let colors: [String]

    init(colors: [String]) {
        self.colors = colors
    }

    func evaluate(guess: [String]) -> [Int] {
        return [1, 0]
    }
}

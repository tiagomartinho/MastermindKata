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

    func testOneMisplacedColor() {
        let mastermind = Mastermind(colors: ["blue", "red"])

        let result = mastermind.evaluate(guess: ["red", "yellow"])

        XCTAssertEqual([0, 1], result)
    }

    func testOnlyOneCorrectColor() {
        let mastermind = Mastermind(colors: ["blue", "red"])

        let result = mastermind.evaluate(guess: ["yellow", "red"])

        XCTAssertEqual([1, 0], result)
    }

    func testOneCorrectColorWithTheRepeatedColor() {
        let mastermind = Mastermind(colors: ["blue", "red"])

        let result = mastermind.evaluate(guess: ["red", "red"])

        XCTAssertEqual([1, 0], result)
    }

    func testIncorrectColors() {
        let mastermind = Mastermind(colors: ["blue", "red"])

        let result = mastermind.evaluate(guess: ["yellow", "white"])

        XCTAssertEqual([0, 0], result)
    }
}

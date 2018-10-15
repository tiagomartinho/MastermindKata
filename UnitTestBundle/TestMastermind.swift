 import XCTest

 class TestMastermind: XCTestCase {

    func testCases() {
        test(message: "WellPlacedColor",
             colors: [.blue], guess: [.blue],
             expected: [1, 0])

        test(message: "NotWellPlacedColor",
             colors: [.blue], guess: [.red],
             expected: [0, 0])

        test(message: "WellPlacedColors",
             colors: [.blue, .red], guess: [.blue, .red],
             expected: [2, 0])

        test(message: "CorrectButNotWellPlacedColors",
             colors: [.red, .blue], guess: [.blue, .red],
             expected: [0, 2])

        test(message: "OneMisplacedColor",
             colors: [.blue, .red], guess: [.red, .yellow],
             expected: [0, 1])

        test(message: "OnlyOneCorrectColor",
             colors: [.blue, .red], guess: [.yellow, .red],
             expected: [1, 0])

        test(message: "OneCorrectColorWithTheRepeatedColor",
             colors: [.blue, .red], guess: [.red, .red],
             expected: [1, 0])

        test(message: "IncorrectColors",
             colors: [.blue, .red], guess: [.yellow, .white],
             expected: [0, 0])

        test(message: "OneCorrectOneMisplaced",
             colors: [.blue, .red, .yellow], guess: [.blue, .white, .red],
             expected: [1, 1])

        test(message: "DifferentSizeGuess",
             colors: [.blue], guess: [.blue, .white, .red, .red],
             expected: [1, 0])

        test(message: "TwoMisplacedOneCorrect",
             colors: [.blue, .red, .red], guess: [.red, .red, .blue],
             expected: [1, 2])

//        test(message: "TwoMisplacedOneCorrect",
//             colors: [.blue, .red, .red], guess: [.red, .blue, .yellow],
//             expected: [0, 2])
    }

    private func test(message: String,
                      colors: [Color],
                      guess: [Color],
                      expected: [Int]) {
        let mastermind = Mastermind(colors: colors)

        let result = mastermind.evaluate(guess: guess)

        let expected = Result(wellPlacedColors: expected[0], misplacedColors: expected[1])
        XCTAssertEqual(expected, result, message)
    }
 }


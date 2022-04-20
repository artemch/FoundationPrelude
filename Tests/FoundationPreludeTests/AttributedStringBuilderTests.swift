import XCTest
@testable import FoundationPrelude

#if os(macOS)
typealias Font = NSFont
#elseif os(iOS)
typealias Font = UIFont
#endif

final class AttributedStringBuilderTests: XCTestCase {
    func testAttributedStringStringEqualToString() throws {
        let attributedString = NSAttributedString {
            NSAttributedString(
                string: "My awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 24, weight: .bold)])
            NSAttributedString(
                string: "Another awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .bold)])
            NSAttributedString(
                string: "So, it is the awesome string to.",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .regular)])
        }
        
        XCTAssertEqual(
            attributedString.string,
            """
            My awesome attributed string.
            Another awesome attributed string.
            So, it is the awesome string to.
            """
        )
    }
    
    func testAttributedStringEqualAttributedString() throws {
        let attributedString = NSAttributedString {
            NSAttributedString(
                string: "My awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 24, weight: .bold)])
            NSAttributedString(
                string: "Another awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .bold)])
            NSAttributedString(
                string: "So, it is the awesome string to.",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .regular)])
        }
        
        let mutableString = NSMutableAttributedString()
        mutableString.append(
            NSAttributedString(
                string: "My awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 24, weight: .bold)])
        )
        mutableString.append(
            NSAttributedString(
                string: "Another awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .bold)])
        )
        mutableString.append(
            NSAttributedString(
                string: "So, it is the awesome string to.",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .regular)])
        )
        
        XCTAssertEqual(
            attributedString,
            mutableString
        )
    }
    
    func testAttributedStringIfStatement() throws {
        let excludeSecondString = true
        let attributedString = NSAttributedString {
            NSAttributedString(
                string: "My awesome attributed string.\n",
                attributes: [.font: Font.systemFont(ofSize: 24, weight: .bold)])
            if !excludeSecondString {
                NSAttributedString(
                    string: "Another awesome attributed string.\n",
                    attributes: [.font: Font.systemFont(ofSize: 17, weight: .bold)])
            }
            NSAttributedString(
                string: "So, it is the awesome string to.",
                attributes: [.font: Font.systemFont(ofSize: 17, weight: .regular)])
        }
        
        XCTAssertEqual(
            attributedString.string,
            """
            My awesome attributed string.
            So, it is the awesome string to.
            """
        )
    }
}

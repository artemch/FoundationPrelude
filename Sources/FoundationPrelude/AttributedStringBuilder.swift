import Foundation

/**
 This is just simple syntactic sugar function builder.
 So you can write it in more declarative way using @resultBuilder.
 Here is an example:
 NSAttributedString {
     NSAttributedString(
         string: "My awesome attributed string.\n",
         attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .bold)])
     NSAttributedString(
         string: "Another awesome attributed string.\n",
         attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .bold)])
     NSAttributedString(
         string: "So, it is the awesome string to.",
         attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .regular)])
 }
 */

@resultBuilder
public struct AttributedStringBuilder {
    public static func buildBlock(_ strings: NSAttributedString...) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        strings.forEach { attributedString.append($0) }
        return attributedString
    }
    
    public static func buildIf(_ value: NSAttributedString?) -> NSAttributedString {
        return value ?? NSAttributedString()
    }
    
    public static func buildEither(first: NSAttributedString) -> NSAttributedString {
        return first
    }

    public static func buildEither(second: NSAttributedString) -> NSAttributedString {
        return second
    }
}

public extension NSAttributedString {
    convenience init(@AttributedStringBuilder builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}

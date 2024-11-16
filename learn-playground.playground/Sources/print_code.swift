import Foundation


public func code(for title: String, sampleCode:()->Void) {
    print("""
-----------
Result for '\(title)'
""")
    sampleCode()
}

import XCTest

class StringExtensionsTests: XCTestCase {

    func testStringIsConvertedToNSString() {
        let result: Any = "Hello World".nsString
        XCTAssertTrue(result is NSString)
        XCTAssertEqual("Hello World", result as! NSString)
    }

}

import XCTest
import Fakery

class StringExtensionsTests: XCTestCase {
    
    private let faker = Faker(locale: "nb-NO")
    
    func testStringIsConvertedToNSString() {
        let randomString: String = faker.name.name()
        XCTAssertEqual(randomString as NSString, randomString.nsString)
    }

}

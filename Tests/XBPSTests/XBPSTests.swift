import XCTest

@testable import XBPS

class XBPSTests: XCTestCase {

  func testExample() throws {
    let xbps = try XBPS()
    XCTAssertNotNil(xbps)
  }

}

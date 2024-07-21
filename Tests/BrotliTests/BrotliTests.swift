import XCTest
import brotlidec
import brotlienc

final class BrotliTests: XCTestCase {

  func testVersion() {
    // change with brotli updates

    XCTAssertEqual(BrotliDecoderVersion(), (1 << 24) | (1 << 12) | 0)

    XCTAssertEqual(BrotliEncoderVersion(), (1 << 24) | (1 << 12) | 0)
  }

}

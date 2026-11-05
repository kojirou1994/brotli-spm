import XCTest
import brotlidec
import brotlienc

final class BrotliTests: XCTestCase {

  func testVersion() {
    // change with brotli updates

    let brotliVersion = (1 as UInt32, 2 as UInt32, 1 as UInt32)

    let versionNum = (brotliVersion.0 << 24) | (brotliVersion.1 << 12) | brotliVersion.2

    XCTAssertEqual(BrotliDecoderVersion(), versionNum)

    XCTAssertEqual(BrotliEncoderVersion(), versionNum)
  }

}

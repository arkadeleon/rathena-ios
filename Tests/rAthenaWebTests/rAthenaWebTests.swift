//
//  rAthenaWebTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaWeb

class rAthenaWebTests: XCTestCase {
    let resourceManager = RAResourceManager.shared
    let webServer = RAWebServer.shared

    override func setUp() async throws {
        resourceManager.copyResourcesToLibraryDirectory()
//        await webServer.start()
    }

    func testWebServer() {
        XCTAssertEqual(webServer.name, "Web Server")
    }

    static var allTests = [
        ("testWebServer", testWebServer),
    ]
}

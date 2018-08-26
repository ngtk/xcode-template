import XCTest
import class Foundation.Bundle

final class xcode_templateTests: XCTestCase {
    func test_init() throws {
        let output = try? run(["init"])
        XCTAssertEqual(output, "initialized.\n")
    }

    func test_generate() throws {
        let output = try? run(["generate"])
        XCTAssertEqual(output, "generated.\n")
    }

    func test_link() throws {
        let output = try? run(["link"])
        XCTAssertEqual(output, "linked.\n")
    }

    private func run(_ arguments: [String]) throws -> String {
        guard #available(macOS 10.13, *) else {
            fatalError()
        }

        let fooBinary = productsDirectory.appendingPathComponent("xcode-template")

        let process = Process()
        process.executableURL = fooBinary
        process.arguments = arguments

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: data, encoding: .utf8)!
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}

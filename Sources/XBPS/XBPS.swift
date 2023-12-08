import Foundation

public class XBinaryPackageSystem {

  private let url: URL
  public let version: String

  //   private let process: Process

  public init(url: URL = URL(fileURLWithPath: "/usr/bin/xbps-query")) throws {
    // version = "test"
    version = try XBinaryPackageSystem.getVersion(url: url)
    self.url = url
  }

  private static func getVersion(url: URL) throws -> String {
    let process = Process()
    process.executableURL = url
    process.arguments = ["--version"]

    let outputPipe = Pipe()
    let errorPipe = Pipe()

    process.standardOutput = outputPipe
    process.standardError = errorPipe

    try process.run()
    let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
    let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()

    let output = String(decoding: outputData, as: UTF8.self)
    let error = String(decoding: errorData, as: UTF8.self)
    print(output)
    return output
  }
}

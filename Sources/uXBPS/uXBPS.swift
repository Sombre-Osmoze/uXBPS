import Foundation
import Logging
import QtBackend
import SwiftCrossUI
import XBPS

class CounterState: Observable {
  @Observed var count = 0
}

private let globalIdentifier = "xyz.osmoze.uXBPS"

@main
struct CounterApp: App {
  // An experimental AppKit backend is also available when on macOS (try AppKitBackend)
  // There's also a Qt5 backend (QtBackend) available when qt5 is installed
  typealias Backend = QtBackend

  let identifier: String = globalIdentifier

  let state = CounterState()

  let xbps = try! XBinaryPackageSystem()

  let windowProperties = WindowProperties(title: "uXBPS")

  let logger = Logger(label: globalIdentifier)

  var body: some View {
    VStack {
      Text("XBPS version: \(xbps.version)")

      HStack {
        Button("-") { state.count -= 1 }
        Text("Count: \(state.count)")
        Button("+") { state.count += 1 }
      }

    }
  }

  private func reset() {
    print("before state reset")
    state.count = 0
    print("after state reset")
  }

}

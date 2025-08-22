import SwiftUI

// swiftlint:disable force_cast
// swiftlint:disable force_unwrapping

struct ContentView: View {
    var body: some View {
        ContentUnavailableView(
            "Swift Updater Test App",
            systemImage: "arrow.down.app",
            description: Text(versionString)
        )
    }

    private var versionString: String {
        "\(shortVersion) (\(version))"
    }

    private var version: String {
        Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }

    private var shortVersion: String {
        Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
}

#Preview {
    ContentView()
}

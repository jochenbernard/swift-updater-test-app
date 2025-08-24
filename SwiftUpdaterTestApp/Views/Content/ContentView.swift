import SwiftUI
import SwiftUpdaterGitHubReleasesUI

// swiftlint:disable force_cast
// swiftlint:disable force_unwrapping

struct ContentView: View {
    @State private var viewModel = ContentViewModel()

    var body: some View {
        HStack(spacing: 8.0) {
            ContentUnavailableView(
                "Swift Updater Test App",
                systemImage: "arrow.down.app",
                description: Text(versionString)
            )

            VStack(spacing: 8.0) {
                fetchButton

                if let update = viewModel.update {
                    SUGitHubUpdateView(update)
                } else if let release = viewModel.latestRelease {
                    VStack(spacing: 8.0) {
                        ReleaseView(release)

                        installButton
                    }
                    .transition(
                        .move(edge: .bottom)
                        .combined(with: .opacity)
                    )
                }
            }
            .animation(
                .default.speed(2.0),
                value: viewModel.latestRelease != nil
            )
        }
        .padding(8.0)
        .frame(
            width: 512.0,
            height: 256.0
        )
    }

    private var fetchButton: some View {
        Button(action: fetch) {
            Text("Fetch latest release")
                .frame(maxWidth: .infinity)
        }
    }

    private var installButton: some View {
        Button(action: install) {
            Text("Install")
                .frame(maxWidth: .infinity)
        }
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

    private func fetch() {
        Task {
            try? await viewModel.fetchLatestRelease()
        }
    }

    private func install() {
        viewModel.installRelease()
    }
}

#Preview {
    ContentView()
}

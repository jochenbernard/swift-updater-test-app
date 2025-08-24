import Foundation
import SwiftUpdaterGitHubReleases

@Observable
@MainActor
class ContentViewModel {
    private let updater = SUGitHubReleasesUpdater(
        owner: "jochenbernard",
        repo: "swift-updater-test-app",
        assetName: "SwiftUpdaterTestApp.zip",
        urlSession: .shared
    )

    private(set) var latestRelease: SUGitHubRelease?
    private(set) var update: SUGitHubUpdate?

    func fetchLatestRelease() async throws {
        latestRelease = try await updater?.getLatestRelease()
    }

    func installRelease() {
        guard let latestRelease else {
            return
        }

        update = updater?.update(to: latestRelease)
        update?.resume()
    }
}

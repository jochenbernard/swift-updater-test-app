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

    func fetchLatestRelease() async throws {
        latestRelease = try await updater?.getLatestRelease()
    }
}

import Foundation
import SwiftUpdater
import SwiftUpdaterGitHubReleases

@Observable
@MainActor
class ContentViewModel {
    private let updater = SUGitHubReleasesUpdater(
        owner: "jochenbernard",
        repository: "swift-updater-test-app",
        assetMatcher: .fileExtension("zip"),
        extractor: .zip(fileMatcher: .fileExtension("app"))
    )

    private(set) var latestRelease: SUGitHubRelease?
    private(set) var update: SUUpdate?

    func fetchLatestRelease() async throws {
        latestRelease = try await updater?.fetchLatestRelease()
    }

    func installRelease() throws {
        guard let latestRelease else {
            return
        }

        update = updater?.update(to: latestRelease)
        try update?.start()
    }
}

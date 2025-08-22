import SwiftUI
import SwiftUpdater
@testable import SwiftUpdaterGitHubReleases

struct ReleaseView: View {
    private let release: SUGitHubRelease

    init(_ release: SUGitHubRelease) {
        self.release = release
    }

    var body: some View {
        GroupBox {
            ScrollView {
                VStack(
                    alignment: .leading,
                    spacing: 8.0
                ) {
                    content
                }
                .padding(4.0)
            }
        }
    }

    @ViewBuilder private var content: some View {
        HStack(spacing: 8.0) {
            value(
                label: "Name",
                value: Text(release.name)
            )

            Spacer()

            value(
                label: "Version",
                value: Text(release.version.string)
            )

            Spacer()

            value(
                label: "Prerelease",
                value: Text(String(describing: release.isPrerelease))
            )
        }

        value(
            label: "Body",
            value: Text(release.body)
        )

        value(
            label: "URL",
            value: Link(destination: release.url) {
                Text(release.url.absoluteString)
                    .multilineTextAlignment(.leading)
            }
        )
    }

    private func value<V: View>(
        label: LocalizedStringResource,
        value: V
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: .zero
        ) {
            Text(label)
                .font(.headline)

            value
        }
    }
}

#Preview {
    ReleaseView(
        SUGitHubRelease(
            name: "Release Name",
            body: "Release Body",
            version: SUVersion(
                major: 0,
                minor: 1,
                patch: 2
            ),
            isPrerelease: false,
            // swiftlint:disable:next force_unwrapping
            url: URL(string: "/")!
        )
    )
}

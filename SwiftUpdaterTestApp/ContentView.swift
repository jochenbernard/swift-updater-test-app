import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .accessibilityHidden(true)
                .foregroundStyle(.tint)
                .imageScale(.large)

            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct LifecycleDetailView: View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
            print("DetailView appeared!")
        }.onDisappear {
            print("DetailView disappeared!")
        }
    }
}

import SwiftUI

public struct LifecycleView: View {
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LifecycleDetailView()) {
                    Text("LifecycleDetailView")
                }
            }
        }.onAppear {
            print("ContentView appeared!")
        }.onDisappear {
            print("ContentView disappeared!")
        }
    }
}

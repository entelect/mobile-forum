import SwiftUI

struct StateView: View {
    @State var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(.title, design: .rounded))
                .bold()
                .padding()

            Button(action: {
                self.title = "Button tapped"
            }) {
                Text("Tap me")
            }
        }
    }
}

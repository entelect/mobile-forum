import SwiftUI

struct BindingView: View {
    @State var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(.title, design: .rounded))
                .bold()
                .padding()

            BindingButtonView(title: self.$title)
                .accentColor(.red)
        }
    }
}

struct BindingButtonView: View {
    @Binding var title: String

    var body: some View {
        Button(action: {
            self.title = "Button tapped"
        }) {
            Text("Tap me")
        }
    }
}

import SwiftUI

public struct ExampleView: View {
    private var title: String

    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .font(.system(.title, design: .rounded))
            .bold()
    }
}

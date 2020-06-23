import SwiftUI

public struct CombinedView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            ExampleView(title: "ExampleView")
            
            Divider()
            
            StateView(title: "StateView")
            
            Divider()
            
            BindingView(title: "BindingView")
            
            Divider()
            
            ObservableView(title: "ObservableView")
            
            Divider()
            
            ListView()
        }
    }
}

import SwiftUI

public struct CombinedView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            // Basic view
            ExampleView(title: "ExampleView")
            
            Divider()
            
            // Rerenders when a state variable changes
            StateView(title: "StateView")
            
            Divider()
            
            // Passes a binding variable that gets modified in a child view
            BindingView(title: "BindingView")
            
            Divider()
            
            // Observed a view model that contains Published variables
            ObservableView(title: "ObservableView")
            
            Divider()
            
            // Displays a list of objects
            ListView()
        }
    }
}

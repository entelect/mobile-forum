import SwiftUI

struct ObservableView: View {
    @ObservedObject var viewModel: ObservableViewModel
    
    init(title: String) {
        viewModel = ObservableViewModel(title: title)
    }
    
    var body: some View {
        VStack {
            Text(self.viewModel.title)
                .font(.system(.title, design: .rounded))
                .bold()
                .padding()
            
            BindingButtonView(title: self.$viewModel.title)
        }
    }
}

class ObservableViewModel: ObservableObject {
    @Published var title: String
    
    init(title: String) {
        self.title = title
    }
}

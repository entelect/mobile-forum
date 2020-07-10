import SwiftUI

public struct AnimationView: View {
    @State var titleColor: Color = .black
    @State var buttonAngle: Angle = .degrees(0)
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("AnimationView")
                .foregroundColor(titleColor)
            
            Button(action: {
                withAnimation(.easeIn(duration: 2)) {
                    self.titleColor = self.titleColor == .black
                        ? .red
                        : .black
                    self.buttonAngle = self.buttonAngle == .degrees(0)
                        ? .degrees(360)
                        : .degrees(0)
                }
                
            }) {
                Text("Press me")
            }
                .rotationEffect(buttonAngle)
                
        }
    }
}

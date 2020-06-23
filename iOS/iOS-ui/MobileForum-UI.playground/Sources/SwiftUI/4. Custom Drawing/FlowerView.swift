import SwiftUI

public struct FlowerView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var colorCycle = 0.0
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Flower")
                .font(.title)
            
            FlowerShapeView(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color(hue: colorCycle, saturation: 1, brightness: 1), style: FillStyle(eoFill: true))
                .frame(width: 300, height: 300)
                .padding(20)
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding([.horizontal, .bottom])
            
            Text("Color")
            Slider(value: $colorCycle)
                .padding([.horizontal, .bottom])
        }
    }
}

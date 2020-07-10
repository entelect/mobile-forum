import UIKit

public class FlowerUIView: UIView {
    private var petalOffset: Double = -40
    private var petalWidth: Double = 100
    
    public init() {
        super.init(frame: .zero)
        self.contentMode = .redraw
        self.backgroundColor = .white
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath(ovalIn: rect)
        
        for number in stride(from: 0.0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            var position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let petal = CGPath(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: Double(rect.width / 2)), transform: &position)
            let petalBezier = UIBezierPath(cgPath: petal)
            bezierPath.append(petalBezier)
        }
        UIColor.red.setFill()
        bezierPath.usesEvenOddFillRule = true
        bezierPath.fill()
    }
    
    public func configure(petalOffset: Double) {
        self.petalOffset = petalOffset
        self.setNeedsDisplay()
    }
    
    public func configure(petalWidth: Double) {
        self.petalWidth = petalWidth
        self.setNeedsDisplay()
    }
}

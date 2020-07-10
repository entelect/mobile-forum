import UIKit

public class UIKitCustomDrawingViewController: UIViewController {
    private lazy var flowerView: FlowerUIView = {
        let flower = FlowerUIView()
        flower.translatesAutoresizingMaskIntoConstraints = false
        return flower
    }()
    
    private lazy var offsetSlider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(offsetSliderValueChanged(sender:)), for: .valueChanged)
        slider.minimumValue = -40
        slider.maximumValue = 40
        return slider
    }()
    
    private lazy var widthSlider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(widthSliderValueChanged(sender:)), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        view.addSubview(flowerView)
        view.addSubview(offsetSlider)
        view.addSubview(widthSlider)
    }
    
    private func configureConstraints() {
        let constraints = [
            flowerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            flowerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flowerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            flowerView.heightAnchor.constraint(equalTo: flowerView.widthAnchor),
            
            offsetSlider.topAnchor.constraint(equalTo: flowerView.bottomAnchor, constant: 30),
            offsetSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            offsetSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            widthSlider.topAnchor.constraint(equalTo: offsetSlider.bottomAnchor, constant: 15),
            widthSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            widthSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ]
        
        constraints.map { $0.isActive = true }
    }
    
    @objc private func offsetSliderValueChanged(sender: UISlider) {
        flowerView.configure(petalOffset: Double(sender.value))
    }
    
    @objc private func widthSliderValueChanged(sender: UISlider) {
        flowerView.configure(petalWidth: Double(sender.value))
    }
}

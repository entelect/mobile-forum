import UIKit
import PlaygroundSupport

// MARK: - SwiftUI
// MARK: Intro to SwiftUI

//PlaygroundPage.current.setLiveView(CombinedView())

// MARK: Lifecycles

//PlaygroundPage.current.setLiveView(LifecycleView())

// MARK: Animations

//PlaygroundPage.current.setLiveView(AnimationView())

// MARK: Custom Drawing

//PlaygroundPage.current.setLiveView(FlowerView())


// MARK: - UIKit
// MARK: Custom Drawing & Autolayout
let customDrawingView = UIKitCustomDrawingViewController()
PlaygroundPage.current.liveView = customDrawingView
PlaygroundPage.current.needsIndefiniteExecution = true


// MARK: - Dark mode colors

//DefaultStyle.Colors.label

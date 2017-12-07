import UIKit

class FirstViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var slider: UISlider!

    // MARK: - Initialization

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }

    final private func commonInit() {
        tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "first"), tag: 0)
        restorationIdentifier = String(describing: type(of: self))
    }

    private let encodingKeySliderValue = "encodingKeySliderValue"

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        guard isViewLoaded else { return }

        coder.encode(slider.value, forKey: encodingKeySliderValue)
    }

    override func decodeRestorableState(with coder: NSCoder)  {
        super.decodeRestorableState(with: coder)
        assert(isViewLoaded, "We assume the controller is never restored without loading its view first.")
        slider.value = coder.decodeFloat(forKey: encodingKeySliderValue)
    }

    override func applicationFinishedRestoringState() {
        print("finished restoring")
    }
}


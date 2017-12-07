import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = [:]) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let appWindow = window else {
            fatalError("failed to create window")
        }

        appWindow.restorationIdentifier = "MainWindow"

        let firstViewController = FirstViewController()

        let secondRootViewController = SecondViewController()
        let secondViewController = UINavigationController(rootViewController: secondRootViewController)

        secondViewController.restorationIdentifier = "NavigationController"

        let tabController = UITabBarController()
        tabController.viewControllers = [firstViewController, secondViewController]
        tabController.restorationIdentifier = "TabController"

        appWindow.rootViewController = tabController
        appWindow.makeKeyAndVisible()
        
        return true
    }

    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        let lib = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!.appendingPathComponent("Saved Application State")
        print("Restoration files: \(lib)")

        return true
    }

    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

}


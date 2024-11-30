import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardView = KeyboardView(viewModel: keyboardViewModel)
        let hostingController = UIHostingController(rootView: keyboardView)

        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - KeyboardActionHandler
    func handleKeyTap(_ char: String) {
        textDocumentProxy.insertText(char)
    }

    func handleBackspace() {
        textDocumentProxy.deleteBackward()
    }

    private var keyboardViewModel: KeyboardViewModel {
        KeyboardViewModel(keyboardViewController: self)
    }
}

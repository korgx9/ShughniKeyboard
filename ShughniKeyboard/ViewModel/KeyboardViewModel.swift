import UIKit
import Combine

class KeyboardViewModel: ObservableObject {
    enum UserIntent {
        case keyTapped(String)
        case shifTapped
        case backSpaceTapped
        case whiteSpaceTapped
        case returnTapped
        case changeKeyType
    }

    @Published var shiftState: ShiftState = .on
    @Published var currentLayout: KeyboardLayout = .letters

    init(keyboardViewController: UIInputViewController) {
        self.keyboardViewController = keyboardViewController
    }

    func process(userIntent: UserIntent) {
        switch userIntent {
        case .keyTapped(let symbol):
            keyboardViewController?.textDocumentProxy.insertText(symbol)
        case .backSpaceTapped:
            keyboardViewController?.textDocumentProxy.deleteBackward()
        case .whiteSpaceTapped:
            keyboardViewController?.textDocumentProxy.insertText(backspaceSymbol)
        case .returnTapped:
            keyboardViewController?.textDocumentProxy.insertText(returnSymbol)
        case .shifTapped:
            toggleShift()
        case .changeKeyType:
            currentLayout = currentLayout == .letters ? .numbers : .letters
        }

        redefineShiftState(by: userIntent)
    }

    private let backspaceSymbol = " "
    private let returnSymbol = "\n"

    private var lastShiftTapTime: Date? = nil
    private weak var keyboardViewController: UIInputViewController?
}

private extension KeyboardViewModel {
    func redefineShiftState(by userIntent: UserIntent) {
        guard shiftState != .capsLock else { return }

        switch userIntent {
        case .keyTapped,
                .backSpaceTapped,
                .whiteSpaceTapped,
                .returnTapped:
            let hasText = keyboardViewController?.textDocumentProxy.documentContextBeforeInput?.isEmpty == false
            shiftState = hasText ? .off : .on
        case .shifTapped, .changeKeyType: break
        }
    }

    func toggleShift() {
        let now = Date()
        if let lastTap = lastShiftTapTime, now.timeIntervalSince(lastTap) < 0.3 {
            shiftState = .capsLock
        } else {
            shiftState = shiftState == .off ? .on : .off
        }
        lastShiftTapTime = now
    }
}

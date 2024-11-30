import SwiftUI

struct ShiftButton: View {
    let state: ShiftState
    let action: EmptyAction

    var body: some View {
        Button(
            action: {
                action()
            },
            label: {
                image
                .font(specialKeysFont)
                .frame(width: 44, height: 42)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(state == .off ? specialBtnBg : .white)
                        .shadow(color: Color.black.opacity(0.6), radius: 0.5, x: 0, y: 0.5)
                )
            }
        )
    }
}

private extension ShiftButton {
    var image: Image {
        switch state {
        case .on: Image(systemName: "shift.fill")
        case .off: Image(systemName: "shift")
        case .capsLock: Image(systemName: "capslock.fill")
        }
    }
}

#Preview {
    ShiftButton(state: .on, action: {})
}

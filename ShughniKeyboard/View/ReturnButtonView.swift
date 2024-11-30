import SwiftUI

struct ReturnButtonView: View {
    let action: EmptyAction

    var body: some View {
        Button(
            action: { action() },
            label: {
                Image(systemName: "return")
                    .font(specialKeysFont)
                    .frame(width: 94, height: 42)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(specialBtnBg)
                            .shadow(color: Color.black.opacity(0.6), radius: 0.5, x: 0, y: 0.5)
                    )
            }
        )
    }
}

#Preview {
    ReturnButtonView(action: {})
}

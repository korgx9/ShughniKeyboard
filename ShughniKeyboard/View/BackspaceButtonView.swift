import SwiftUI

struct BackspaceButtonView: View {
    let action: EmptyAction

    var body: some View {
        Button(
            action: { action() },
            label: {
                Image(systemName: "delete.left")
                    .font(specialKeysFont)
                    .frame(width: 44, height: 42)
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
    BackspaceButtonView(action: {})
}

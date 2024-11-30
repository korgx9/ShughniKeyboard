import SwiftUI

struct SpaceButtonView: View {
    let action: EmptyAction

    var body: some View {
        Button(
            action: { action() },
            label: {
                Text("")
                    .font(specialKeysFont)
                    .frame(maxWidth: .infinity)
                    .frame(height: 42)
                    .foregroundColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.white)
                            .shadow(color: Color.black.opacity(0.6), radius: 0.5, x: 0, y: 0.5)
                    )
            }
        )
    }
}

#Preview {
    SpaceButtonView(action: {})
}

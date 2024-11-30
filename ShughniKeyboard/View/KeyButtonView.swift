import SwiftUI

struct KeyButtonView: View {
    let symbol: String
    let action: StringAction

    var body: some View {
        Button(
            action: {
                action(symbol)
            },
            label: {
                Spacer()
                Text(symbol)
                    .font(ordinaryKeysFont)
                    .frame(height: 42)
                    .foregroundColor(.black)
                Spacer()
            }
        )
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.6), radius: 0.5, x: 0, y: 0.5)
        )
    }
}

#Preview {
    KeyButtonView(symbol: "A", action: {_ in })
}

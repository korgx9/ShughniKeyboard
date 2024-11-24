import SwiftUI

struct KeyboardView: View {
    @State private var isUppercase = false

    let firstRowLower = "žšʓδůẋɣ̌čêϑ"
    let firstRowUpper = "ŽŠӠΔŮẊƔ̌ČÊƟ"
    let secondRow = "qwertyuiop"
    let thirdRowLower = "asdfgɣjkl"
    let thirdRowUpper = "ASDFGƔJKL"
    let fourthRow = "zxcvbnm"

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                ForEach(Array(currentRow(for: firstRowLower, uppercased: firstRowUpper)), id: \.self) { char in
                    KeyButton(char: String(char), action: handleKeyTap)
                }
            }
            HStack {
                ForEach(Array(currentRow(for: secondRow, uppercased: secondRow.uppercased())), id: \.self) { char in
                    KeyButton(char: String(char), action: handleKeyTap)
                }
            }
            HStack {
                ForEach(Array(currentRow(for: thirdRowLower, uppercased: thirdRowUpper)), id: \.self) { char in
                    KeyButton(char: String(char), action: handleKeyTap)
                }
            }
            HStack {
                ForEach(Array(currentRow(for: fourthRow, uppercased: fourthRow.uppercased())), id: \.self) { char in
                    KeyButton(char: String(char), action: handleKeyTap)
                }
            }
            HStack {
                Button(action: toggleCase) {
                    Text("⇧")
                        .frame(width: 50, height: 40)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 8) // Отступы от краев клавиатуры
            .padding(.vertical, 12) // Отступы сверху и снизу
            .background(Color(red: 209/255, green: 213/255, blue: 219/255)) // Светло-серый фон клавиатуры
    }

    func currentRow(for lowercased: String, uppercased: String) -> String {
        isUppercase ? uppercased : lowercased
    }

    func toggleCase() {
        isUppercase.toggle()
    }

    func handleKeyTap(char: String) {
        // Handle the key tap, you would need to implement this to send text input to the host app.
    }
}

struct KeyButton: View {
    let char: String
    let action: (String) -> Void

    var body: some View {
        Button(action: { action(char) }) {
            Text(char)
                .font(.system(size: 18, weight: .regular))
                .frame(width: 36, height: 42) // Размер кнопок близкий к стандарту
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white) // Белый фон кнопок
                        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0, y: 1) // Легкая тень
                )
                .foregroundColor(.black) // Черный текст
        }
    }
}

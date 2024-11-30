import SwiftUI

struct AlphabetivLayoutView: View {
    let shiftState: ShiftState
    let keyAction: StringAction
    let shiftAction: EmptyAction
    let backspaceAction: EmptyAction

    var body: some View {
        HStack(spacing: 6) {
            ForEach(currentRow(for: Self.firstRowLower, uppercased: Self.firstRowUpper), id: \.self) { char in
                KeyButtonView(symbol: String(char)) { keyAction($0) }
            }
        }
        HStack(spacing: 6) {
            ForEach(currentRow(for: Self.secondRowLower, uppercased: Self.secondRowUpper), id: \.self) { char in
                KeyButtonView(symbol: String(char)) { keyAction($0) }
            }
        }
        HStack(spacing: 6) {
            ForEach(currentRow(for: Self.thirdRowLower, uppercased: Self.thirdRowUpper), id: \.self) { char in
                KeyButtonView(symbol: String(char)) { keyAction($0) }
            }
        }
        HStack(spacing: 16) {
            ShiftButton(state: shiftState) { shiftAction() }

            HStack(spacing: 6) {
                ForEach(currentRow(for: Self.fourthRowLower, uppercased: Self.fourthRowUpper), id: \.self) { char in
                    KeyButtonView(symbol: String(char)) { keyAction($0) }
                }
            }

            BackspaceButtonView { backspaceAction() }
        }
    }

    private static let firstRowLower = Array("žšʓδůẋɣ̌čêϑ")
    private static let firstRowUpper = Array("ŽŠӠΔŮẊƔ̌ČÊƟ")
    private static let secondRowLower = Array("qwertyuiop")
    private static let secondRowUpper = Array("qwertyuiop".uppercased())
    private static let thirdRowLower = Array("asdfgɣjkl")
    private static let thirdRowUpper = Array("ASDFGƔJKL")
    private static let fourthRowLower = Array("zxcvbnm")
    private static let fourthRowUpper = Array("zxcvbnm".uppercased())
}

private extension AlphabetivLayoutView {
    func currentRow(for lowercased: Array<Character>, uppercased: Array<Character>) -> Array<Character> {
        shiftState == .off ? lowercased : uppercased
    }
}

#Preview {
    AlphabetivLayoutView(
        shiftState: .on,
        keyAction: { _ in },
        shiftAction: { },
        backspaceAction: { }
    )
}

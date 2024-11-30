import SwiftUI

// TODO: Move into design system
let specialBtnBg = Color(red: 172/255, green: 177/255, blue: 185/255)
let specialKeysFont = Font.system(size: 16, weight: .regular)
let ordinaryKeysFont = Font.system(size: 22, weight: .regular)
let normalVerticalSpacing: CGFloat = 12.0

typealias StringAction = (String) -> Void
typealias EmptyAction = () -> Void

struct KeyboardView: View {
    init(viewModel: KeyboardViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: normalVerticalSpacing) {
            switch viewModel.currentLayout {
            case .letters:
                AlphabetivLayoutView(
                    shiftState: viewModel.shiftState,
                    keyAction: { viewModel.process(userIntent: .keyTapped($0)) },
                    shiftAction: { viewModel.process(userIntent: .shifTapped) },
                    backspaceAction: { viewModel.process(userIntent: .backSpaceTapped) }
                )
            case .numbers:
                numberKeyboard
            }

            HStack(spacing: 8) {
                KeyTypeButtonView(keyType: viewModel.currentLayout) { viewModel.process(userIntent: .changeKeyType) }

                SpaceButtonView { viewModel.process(userIntent: .whiteSpaceTapped) }

                ReturnButtonView { viewModel.process(userIntent: .returnTapped) }
            }
            .padding(.horizontal, 4)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 4)
        .background(Color(red: 209/255, green: 213/255, blue: 219/255))
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
    }

    @ObservedObject private var viewModel: KeyboardViewModel



    private var numberKeyboard: some View {
            VStack(spacing: normalVerticalSpacing) {
                let firstRow = Array("1234567890")
                let secondRow = Array("-/:;()$&@\"")
                let thirdRow = Array(".?,!'")

                HStack {
                    ForEach(firstRow, id: \.self) { char in
                        KeyButtonView(symbol: String(char)) { viewModel.process(userIntent: .keyTapped($0)) }
                    }
                }
                HStack {
                    ForEach(secondRow, id: \.self) { char in
                        KeyButtonView(symbol: String(char)) { viewModel.process(userIntent: .keyTapped($0)) }
                    }
                }
                HStack {
                    ForEach(thirdRow, id: \.self) { char in
                        KeyButtonView(symbol: String(char)) { viewModel.process(userIntent: .keyTapped($0)) }
                    }
                }
            }
        }

}

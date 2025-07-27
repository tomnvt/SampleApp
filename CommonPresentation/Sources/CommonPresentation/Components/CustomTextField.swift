import SwiftUI

public struct CustomTextField: View {
    // MARK: - Properties
    let title: String
    let placeholderText: String
    @Binding var userInput: String
    var shakeTrigger: Bool?
    var hidableUserInput: Bool = false
    var isMultiline: Bool = false

    @State private var isSecured: Bool = false

    private let textColor: Color = .black

    public init(
        title: String,
        placeholderText: String,
        userInput: Binding<String>,
        shakeTrigger: Bool? = nil,
        hidableUserInput: Bool = false,
        isMultiline: Bool = false,
        isSecured: Bool = false
    ) {
        self.title = title
        self.placeholderText = placeholderText
        self._userInput = userInput
        self.shakeTrigger = shakeTrigger
        self.hidableUserInput = hidableUserInput
        self.isMultiline = isMultiline
        self.isSecured = isSecured
    }

    // MARK: - Body
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.meta1)
                .padding(.bottom, .x0p5)
                .padding(.leading, .x2)
                .foregroundColor(Asset.Colors.textFieldTitle.swiftUIColor)

            Rectangle()
                .background(Asset.Colors.textFieldBackground.swiftUIColor)
                .cornerRadius(8)
                .frame(height: isMultiline ? 150 : 50)
                .overlay {
                    ZStack(alignment: .trailing) {
                        if isSecured {
                            SecureField("", text: $userInput)
                                .placeholder(when: userInput.isEmpty) {
                                    Text(placeholderText).foregroundColor(.gray)
                                }
                                .foregroundColor(textColor)
                        } else if isMultiline {
                            TextEditor(text: $userInput)
                                .foregroundColor(textColor)
                        } else {
                            TextField("", text: $userInput)
                                .placeholder(when: userInput.isEmpty) {
                                    Text(placeholderText).foregroundColor(.gray)
                                }
                                .foregroundColor(textColor)
                                .autocapitalization(.none)
                        }
                        if hidableUserInput {
                            Button(action: {
                                isSecured.toggle()
                            }, label: {
                                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                    .accentColor(.gray)
                            })
                        }
                    }
                    .font(.body4.regular)
                    .padding()
                }
                .shake(shakeTrigger: shakeTrigger ?? false)
                .padding(.bottom, .x6)
        }.onAppear {
            isSecured = hidableUserInput
        }
    }
}

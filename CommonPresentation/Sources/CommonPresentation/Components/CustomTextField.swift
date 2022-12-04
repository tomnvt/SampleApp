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
                .font(.system(size: 12))
                .padding(.bottom, .x0p5)
                .padding(.leading, .x2)
                .foregroundColor(Color(hex: 0x40B8B8))

            Rectangle()
                .stroke(Color(hex: 0xEFEFEF), lineWidth: 1)
                .background(Color(hex: 0xF8F9FA))
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
                    .font(.system(size: 14))
                    .padding()
                }
                .shake(shakeTrigger: shakeTrigger ?? false)
                .padding(.bottom, .x6)
        }.onAppear {
            isSecured = hidableUserInput
        }
    }
}

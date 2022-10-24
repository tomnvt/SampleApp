import CommonPresentation
import CommonDomain
import SwiftUI

struct ForgottenPasswordView: View {
    typealias ViewModel = ForgottenPasswordViewModel

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            BackButton()
                .onTapGesture {
                    viewModel.onBackButtonTapped()
                }
            VStack(spacing: 0) {
                Spacer()
                logoImage
                Text(L10n.General.forgottenPassword)
                    .font(.title)
                    .padding(.bottom, 32)
                Text(L10n.General.enterEmail)
                    .font(.headline)
                    .padding(.bottom, 16)
                emailTextField
                    .padding(.horizontal, 16)
                resetPasswordButton
                    .padding(.horizontal, 16)
                Spacer()
            }
        }.navigationBarHidden(true)
    }

    var emailTextField: some View {
        CustomTextField(
            title: L10n.General.email,
            placeholderText: L10n.General.email,
            userInput: $viewModel.emailInput,
            shakeTrigger: viewModel.emailFieldShakeTrigger,
            hidableUserInput: false
        )
    }

    var logoImage: some View {
        Image(uiImage: Asset.logo.image)
            .resizable()
            .scaledToFit()
            .frame(height: 100)
            .padding(.bottom, 54)
            .animation(.spring())
    }

    var resetPasswordButton: some View {
        Button(action: {
            viewModel.onResetBtnTap()
        }, label: {
            Rectangle()
                .overlay {
                    Text(L10n.General.forgottenPassword)
                        .foregroundColor(Color.white)
                }
                .frame(height: 56)
                .cornerRadius(8)
        }).padding(.bottom, 24)
    }
}

struct ForgottenPasswordSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ForgottenPasswordView(
            viewModel: ForgottenPasswordViewModel(
                onEvent: { _ in },
                loginInteractor: PreviewLoginInteractor()
            )
        )
    }
}

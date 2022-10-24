import CommonPresentation
import SwiftUI

struct EmailLoginView: View {
    @ObservedObject var viewModel: EmailLoginViewModel

    var body: some View {
        VStack(spacing: 0) {
            emailTextField
            passwordTextField
            signInButton
            forgottenPasswordButton
        }
        .padding(.horizontal, 20)

        .handleLoading(isLoading: viewModel.isLoading)
        .navigationBarHidden(true)
    }

    var emailTextField: some View {
        CustomTextField(
            title: L10n.General.email,
            placeholderText: L10n.General.email,
            userInput: $viewModel.email,
            shakeTrigger: viewModel.emailFieldShakeTrigger,
            hidableUserInput: false
        )
    }

    var passwordTextField: some View {
        CustomTextField(
            title: L10n.General.password,
            placeholderText: L10n.General.password,
            userInput: $viewModel.password,
            shakeTrigger: viewModel.passwordFieldShakeTrigger,
            hidableUserInput: true
        )
    }

    var signInButton: some View {
        Button(action: {
            viewModel.loginTapped()
        }, label: {
            Rectangle()
                .overlay {
                    Text(L10n.General.signIn)
                        .foregroundColor(Color.white)
                }
                .frame(height: 56)
                .cornerRadius(8)
        }).padding(.bottom, 24)
    }

    var forgottenPasswordButton: some View {
        Button(action: {
            viewModel.forgotenPasswordTapped()
        }, label: {
            Text(L10n.General.forgottenPassword)
                .underline()
                .frame(alignment: .center)
                .padding(.bottom, 32)
        })
    }
}

struct EmailLoginSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView(
            viewModel: EmailLoginViewModel(
                loginInteractor: PreviewLoginInteractor(),
                onEvent: { _ in }
            )
        )
    }
}

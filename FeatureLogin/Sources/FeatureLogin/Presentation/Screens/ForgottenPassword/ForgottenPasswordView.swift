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
                    .padding(.bottom, .x8)
                Text(L10n.General.enterEmail)
                    .font(.headline)
                    .padding(.bottom, .x4)
                emailTextField
                    .padding(.horizontal, .x4)
                resetPasswordButton
                    .padding(.horizontal, .x4)
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
        Image(uiImage: Asset.Images.forgottenPassword.image)
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .tint(.white)
            .frame(height: 100)
            .padding(.bottom, 54)
    }

    var resetPasswordButton: some View {
        Button(action: {
            viewModel.onResetBtnTap()
        }, label: {
            Text(L10n.General.forgottenPassword)
        })
        .buttonStyle(PrimaryButtonStyle())
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

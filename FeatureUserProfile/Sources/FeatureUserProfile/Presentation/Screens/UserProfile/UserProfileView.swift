import SwiftUI
import CommonDomain
import CommonPresentation

struct UserProfileView: View {
    @ObservedObject var viewModel: UserProfileViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 16) {
                if let urlString = viewModel.userProfile?.photoURL,
                   let url =  URL(string: urlString){
                    profileImage(url: url)
                }
                username
                email
                Spacer()
                deleteAccountButton
                logoutButton
            }.padding()
        }.navigationTitle("Profile")
    }

    func profileImage(url: URL) -> some View {
        let size: CGFloat = 150
        return AsyncImage(
            url: url,
            content: { image in
                image.resizable()
                    .resizable()
            },
            placeholder: {
                ProgressView()
            }
        )
        .border(.black, width: 1)
        .frame(size: size)
        .clipShape(Circle())
        .overlay(
            RoundedRectangle(cornerRadius: size / 2)
                .stroke(Color.yellow, lineWidth: 3)
        )
    }

    var username: some View {
        Text(viewModel.userProfile?.userName ?? "")
            .font(.title)
    }

    var email: some View {
        Text(viewModel.userProfile?.email ?? "")
    }

    var deleteAccountButton: some View {
        Button(action: {
            viewModel.onDeleteAccountButtonTap()
        }, label: {
            Rectangle()
                .foregroundColor(Color.gray)
                .overlay {
                    Text("Delete account")
                        .foregroundColor(Color.white)
                }
                .frame(height: 56)
                .cornerRadius(8)
        })
    }

    var logoutButton: some View {
        Button(action: {
            viewModel.onLogoutButtonTap()
        }, label: {
            Rectangle()
                .foregroundColor(Color.gray)
                .overlay {
                    Text("Logout")
                        .foregroundColor(Color.white)
                }
                .frame(height: 56)
                .cornerRadius(8)
        })
    }
}

struct UserProfileView_Previews: PreviewProvider {
    class UserRepositoryPreview: UserRepositoryProtocol {
        func onboardingWasShown() -> Bool { return false }
        func setOnboardingShown() {}
        func isUserLoggedIn() -> Bool { return false }
        func deleteUserData() {}
        func getUserProfile() -> UserProfile {
            UserProfile(
                photoURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlgckJKuKPLPXykG5eBuRqTCMds9uWCMSOhg&usqp=CAU",
                userName: "Mr. Burns",
                email: "smithers@burns.com"
            )
        }
    }

    static var previews: some View {
        UserProfileView(
            viewModel: UserProfileViewModel(
                userRepository: UserRepositoryPreview(),
                loginInteractor: PreviewLoginInteractor(),
                onEvent: { _ in }
            )
        )
    }
}

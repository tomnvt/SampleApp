import SwiftUI

struct OnboardingPageView: View {
    private let config: OnboardingPageConfig

    init(config: OnboardingPageConfig) {
        self.config = config
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(config.titleText)
                    .font(Font.system(size: 28, weight: .bold, design: .default))
                    .lineSpacing(8)
                    .padding(.bottom, .x4)
                    .fixedSize(horizontal: false, vertical: true)
                Text(config.messageText)
                    .font(Font.system(size: 16, weight: .regular, design: .default))
                    .lineSpacing(6)
                    .padding(.bottom, .x10)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 28)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            config: .init(
                index: 0,
                titleText: "Title",
                messageText: "Message"
            )
        )
    }
}

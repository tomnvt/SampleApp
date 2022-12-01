import CommonPresentation
import SwiftUI

struct OnboardingView: View {

    // MARK: - Types
    enum Event {
        case skipButtonTapped(pageNumber: Int)
        case startButtonTapped
    }

    // MARK: - Properties
    private let activePageCircleSize: CGFloat = 8
    private let inactivePageCircleSize: CGFloat = 6

    var onEvent: (Event) -> Void
    @State private var currentPage = 1

    // MARK: - Init
    init(onEvent: @escaping (Event) -> Void) {
        self.onEvent = onEvent
    }
}

// MARK: - Body
extension OnboardingView {

    var body: some View {
        ZStack {
            backgroundGradient
            onboardingPagesTabView
            controlsOverlay
        }.navigationBarHidden(true)
    }
}

// MARK: - Subviews
private extension OnboardingView {

    @ViewBuilder
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    .gray,
                    .white
                ]
            ),
            startPoint: .center, endPoint: .bottomTrailing
        ).ignoresSafeArea()
    }

    @ViewBuilder
    var onboardingPagesTabView: some View {
        TabView(selection: $currentPage) {
            ForEach(OnboardingPageConfig.allPages) { config in
                OnboardingPageView(config: config)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
    }

    @ViewBuilder
    var controlsOverlay: some View {
        VStack {
            topControls
            Spacer()
            bottomControls
        }
    }

    @ViewBuilder
    var topControls: some View {
        HStack {
            HStack {
                ForEach(1..<OnboardingPageConfig.allPages.count + 1, id: \.self) { index in
                    Circle()
                        .frame(
                            width: index == currentPage ? activePageCircleSize : inactivePageCircleSize,
                            height: index == currentPage ? activePageCircleSize : inactivePageCircleSize
                        )
                }
            }
            Spacer()
            Button(action: {
                onEvent(.skipButtonTapped(pageNumber: currentPage))
            }, label: {
                Text("Skip")
            })
        }.padding()
    }

    @ViewBuilder
    var bottomControls: some View {
        HStack {
            Spacer()
            Button(action: {
                onEvent(.startButtonTapped)
            }, label: {
                Circle()
                    .foregroundColor(Color(hex: 0x222222))
                    .frame(size: 78)
                    .overlay(alignment: .center) {
                        if currentPage == 5 {
                            Text("Start")
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 39)
                            .stroke(Color.white.opacity(0.38), lineWidth: 3)
                    )
                    .padding(.trailing, 24)
                    .padding(.bottom, 24)
            })
        }
    }
}

import SwiftUI

public extension View {
    func handleLoading(isLoading: Bool, text: String, blursBackground: Bool = true) -> some View {
        return styleView(isLoading: isLoading, blursBackground: blursBackground)
            .overlay(
                ZStack {
                    if isLoading {
                        ProgressView(text)
                            .style()
                    }
                })
            .animation(.easeInOut, value: isLoading)
    }

    func handleLoading(isLoading: Bool, blursBackground: Bool = true) -> some View {
        return styleView(isLoading: isLoading, blursBackground: blursBackground)
            .overlay(
                ZStack {
                    if isLoading {
                        ProgressView()
                            .style()
                    }
                })
    }

    private func styleView(isLoading: Bool, blursBackground: Bool) -> some View {
        let blurActive = isLoading && blursBackground
        return disabled(isLoading ? true : false)
            .blur(radius: blurActive ? 2 : 0)
            .transition(.opacity)
    }
}

private extension ProgressView {
    func style() -> some View {
        return self
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .foregroundColor(.white)
            .font(.title)
            .padding(24)
            .background(
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(.white)
            )
            .shadow(radius: 16)
    }
}


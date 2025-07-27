import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
                    .zIndex(1)
                    .transition(.opacity)
                    .animation(.default, value: shouldShow)
            }
            self
        }
    }
}

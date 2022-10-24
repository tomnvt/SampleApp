import SwiftUI

public struct BackButton: View {
    public init() {}

    public var body: some View {
        Image(systemName: "chevron.backward")
            .foregroundColor(.black)
            .frame(size: 44)
            .padding()
    }
}

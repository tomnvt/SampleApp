import SwiftUI

final class BasicDetailViewModel: ObservableObject {
    @Published var model: Model?

    // MARK: - Init
    init(model: Model) {
        self.model = model
    }
}

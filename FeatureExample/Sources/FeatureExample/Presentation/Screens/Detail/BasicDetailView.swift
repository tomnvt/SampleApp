import SharedUI
import SwiftUI

struct BasicDetailView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: BasicDetailViewModel

    // MARK: - Body
    var body: some View {
        Text(L10n.List.detailText(viewModel.model?.property ?? ""))
    }
}

// MARK: - Preview
struct BasicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return BasicDetailView(
            viewModel: BasicDetailViewModel(
                model: Model(id: "1", property: "PREVIEW")
            )
        )
    }
}

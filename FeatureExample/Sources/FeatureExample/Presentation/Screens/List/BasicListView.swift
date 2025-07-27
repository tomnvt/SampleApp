import SharedUI
import SwiftUI

struct BasicListView: View {
    // MARK: - Aliases
    typealias ViewModel = BasicListViewModel

    // MARK: - Properties
    @ObservedObject var viewModel: ViewModel

    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.id) { model in
                Button(
                    action: {
                        viewModel.onItemSelected(model: model)
                    },
                    label: {
                        Text(model.property)
                    }
                )
                .swipeActions {
                    Button(L10n.List.delete) {
                        viewModel.onDeleteButtonTap(model: model)
                    }
                }
            }
        }
        .toolbar {
            Button(
                action: viewModel.onAddButtonTap,
                label: {
                    Text(L10n.List.addItem)
                }
            )
        }
        .background(.black)
    }
}

struct BasicListView_Previews: PreviewProvider {
    class PreviewInteractor: InteractorProtocol {
        func getSomeItems() async throws -> [Model] {
            return [Model(id: "1", property: "Preview")]
        }
        func addItem() async throws {}
        func deleteItem(model: Model) async throws {}
    }

    static var previews: some View {
        BasicListView(
            viewModel: BasicListViewModel(
                eventdelegate: nil,
                interactor: PreviewInteractor()
            )
        )
    }
}

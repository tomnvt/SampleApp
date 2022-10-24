import SwiftUI

final class BasicListViewModel: ObservableObject {
    // MARK: - Aliases
    typealias EventHandler = BasicListEventHandler

    @Published var items: [Model] = []
    @Published var isLoading: Bool = false

    // MARK: - Properties
    private var eventHandler: EventHandler?
    private let interactor: InteractorProtocol

    // MARK: - Init
    init(
        eventdelegate: EventHandler?,
        interactor: InteractorProtocol
    ) {
        self.interactor = interactor
        self.eventHandler = eventdelegate
        loadData()
    }

    // MARK: - Data loading
    func loadData() {
        Task {
            do {
                let someItems = try await interactor.getSomeItems()
                await MainActor.run {
                    items = someItems
                }
            } catch {
                // TODO: Error handling
            }
        }
    }

    func onAddButtonTap() {
        Task {
            try await interactor.addItem()
            loadData()
        }
    }
}

// MARK: - Protocol conformance
extension BasicListViewModel {
    func onItemSelected(model: Model) {
        eventHandler?.handleEvent(.itemSelected(model))
    }

    func onDeleteButtonTap(model: Model) {
        Task {
            try await interactor.deleteItem(model: model)
            loadData()
        }
    }
}

protocol InteractorProtocol {
    func getSomeItems() async throws -> [Model]
    func addItem() async throws
    func deleteItem(model: Model) async throws
}

class Interactor {
    // MARK: - Properties
    private let repository: RepositoryProtocol

    // MARK: - Init
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: - Protocol conformance
extension Interactor: InteractorProtocol {
    func getSomeItems() async throws -> [Model] {
        return try await repository.getModel()
    }

    func addItem() async throws {
        try await repository.saveNewItem()
    }

    func deleteItem(model: Model) async throws {
        try await repository.deleteItem(model: model)
    }
}

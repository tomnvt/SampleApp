import SharedData
import Foundation

class Repository {

    // MARK: - Properties
    private let modelEntityDBDataSource: CoreDataDataSource

    // MARK: - Init
    init(dataSource: CoreDataDataSource) {
        self.modelEntityDBDataSource = dataSource
    }

}

// MARK: - Protocol conformance
extension Repository: RepositoryProtocol {

    func getModel() async throws -> [Model] {
        return try modelEntityDBDataSource.getModels()
            .map {
                Model(id: $0.entityId, property: $0.property)
            }
    }

    func saveNewItem() async throws {
        try modelEntityDBDataSource.saveModel(id: UUID().uuidString, property: "\(Date())")
    }

    func deleteItem(model: Model) async throws {
        try modelEntityDBDataSource.deleteModel(model)
    }
}

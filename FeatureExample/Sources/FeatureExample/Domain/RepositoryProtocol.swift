protocol RepositoryProtocol {
    func getModel() async throws -> [Model]
    func saveNewItem() async throws
    func deleteItem(model: Model) async throws
}

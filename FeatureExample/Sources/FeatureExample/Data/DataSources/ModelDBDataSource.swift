import CommonData
import CoreData

extension CoreDataDataSource {
    func getModels() throws -> [ModelEntity] {
        let fetchRequest = ModelEntity.fetchRequest()
        return try viewContext.fetch(fetchRequest)
    }

    func saveModel(id: String, property: String) throws {
        let newFavoriteProduct = ModelEntity(context: viewContext)
        newFavoriteProduct.entityId = id
        newFavoriteProduct.property = property

        try viewContext.save()
    }

    func deleteModel(_ model: Model) throws {
        let fetchRequest = NSFetchRequest<ModelEntity>(entityName: "ModelEntity")
        fetchRequest.predicate = NSPredicate(format: "entityId == %@", model.id)
        if let result = try viewContext.fetch(fetchRequest).first {
            viewContext.delete(result)
            try viewContext.save()
        }
    }
}

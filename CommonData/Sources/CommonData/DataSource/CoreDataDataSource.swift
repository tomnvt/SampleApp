import CoreData

public class CoreDataDataSource: NSPersistentContainer {
    public init() {
        guard
            let objectModelURL = Bundle.module.url(forResource: "Model", withExtension: "momd"),
            let objectModel = NSManagedObjectModel(contentsOf: objectModelURL)
        else {
            fatalError("Failed to retrieve the object model")
        }

        super.init(name: "Model", managedObjectModel: objectModel)

        loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core data failed to load - \(error)")
            }
            print("Core data loaded: \(description)")
        }
    }

    public func clearAll() {
        guard let url = persistentStoreDescriptions.first?.url else { return }
        do {
            try persistentStoreCoordinator
                .destroyPersistentStore(at: url, ofType: NSSQLiteStoreType, options: nil)
            try persistentStoreCoordinator
                .addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            print("!!! ERROR !!! \(error)")
        }
    }
}

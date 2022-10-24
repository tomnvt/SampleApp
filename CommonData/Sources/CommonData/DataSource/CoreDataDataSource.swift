import CoreData

public class CoreDataDataSource: NSPersistentContainer {

    public static let shared = CoreDataDataSource(
        objectModelURL: Bundle.module.url(forResource: "Model", withExtension: "momd")
    )

    public init(objectModelURL: URL?) {
        guard
            let objectModelURL,
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

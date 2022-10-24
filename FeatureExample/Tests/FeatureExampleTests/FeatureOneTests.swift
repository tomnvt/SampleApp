import CommonData
import CoreData
import XCTest
@testable import FeatureExample

final class CoreDataManagerTests: XCTestCase {
    var dataSource: ModelEntityDataSource {
        CoreDataDataSource(objectModelURL: Bundle.module.url(forResource: "Model", withExtension: "momd"))
    }

    func testCoreDataManager() async throws {
        try? dataSource.saveModel(id: UUID().uuidString, property: "123")
        let models = try? dataSource.getModels()
        XCTAssert(models?.last?.property == "123")
    }

    func testModelEntity() {
        let modelEntity = (dataSource as? NSPersistentContainer)?.managedObjectModel.entitiesByName["ModelEntity"]!
        verifyAttribute(named: "property", on: modelEntity, hasType: .string)
    }

    func verifyAttribute(
        named name: String,
        on entity: NSEntityDescription?,
        hasType type: NSAttributeDescription.AttributeType
    ) {
        guard let entity = entity,
              let attribute = entity.attributesByName[name] else {
            XCTFail("\(entity!.name!) is missing expected attribute \(name)")
            return
        }
        XCTAssertEqual(type, attribute.type)
    }
}

import Foundation
import CoreData

extension ModelEntity {

    @nonobjc class func fetchRequest() -> NSFetchRequest<ModelEntity> {
        return NSFetchRequest<ModelEntity>(entityName: "ModelEntity")
    }

    @NSManaged var entityId: String
    @NSManaged var property: String

}

extension ModelEntity {

    override var description: String {
        return "ModelEntity"
    }

}

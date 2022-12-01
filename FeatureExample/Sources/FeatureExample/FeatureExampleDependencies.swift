import CommonData

// sourcery: ModuleDependencies
public class FeatureExampleDependencies {
    let coreDataDataSource: CoreDataDataSource

    public init(coreDataDataSource: CoreDataDataSource) {
        self.coreDataDataSource = coreDataDataSource
    }
}

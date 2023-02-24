import Utils
import UIKit
import SwiftUI

public struct FeatureExampleManager {
    private let dependencies: FeatureExampleDependencies
    private let navigationController: UINavigationController

    public init(dependencies: FeatureExampleDependencies, navigationController: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigationController
    }

    public func start() {
        let view = BasicListView(
            viewModel: BasicListViewModel(
                eventdelegate: self,
                interactor: Interactor(
                    repository: Repository(dataSource: dependencies.coreDataDataSource)
                )
            )
        )
        navigationController.pushView(view)
    }
}

extension FeatureExampleManager: BasicListEventHandler {
    func handleEvent(_ event: BasicListEvent) {
        switch event {
        case .itemSelected(let model):
            AnalyticsLogger.logEvent(.itemSelected(id: model.id, name: model.property))
            showDetail(for: model)
        }
    }

    func showDetail(for model: Model) {
        let view = BasicDetailView(
            viewModel: BasicDetailViewModel(
                model: model
            )
        )
        navigationController.pushView(view)
    }
}

import CommonData
import CommonPresentation
import Utils
import UIKit
import SwiftUI

public struct FeatureExampleManager {
    private let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func start() {
        let view = BasicListView(
            viewModel: BasicListViewModel(
                eventdelegate: self,
                interactor: Interactor(
                    repository: Repository(
                        dataSource: CoreDataDataSource.shared
                    )
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

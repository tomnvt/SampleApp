import UIKit

public extension UIAlertController {

    static func show(title: String? = nil, message: String, confirmTitle: String, onConfirm: (() -> Void)? = nil) {
        UIAlertController.show(
            title: title,
            message: message,
            actions: [UIAlertAction(title: confirmTitle, style: .default, handler: { _ in 
                onConfirm?()
            })]
        )
    }

    static func show(title: String? = nil, message: String, actions: [UIAlertAction]) {
        DispatchQueue.main.async {
            guard let vc = UIApplication.topViewController() else { return }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            actions.forEach({ alertController.addAction($0) })
            alertController.modalPresentationStyle = .overCurrentContext
            vc.present(alertController, animated: true, completion: nil)
            if actions.count == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    alertController.dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    static func showErrorAlert(error: Error, onRetry: (() -> Void)?) {
        Task {
            await MainActor.run {
                #if DEBUG
                print("[ERROR] Catched error: \(error)")
                #endif
                let alert = UIAlertController(
                    title: L10n.Alert.General.error,
                    message: L10n.Alert.General.errorMessage(error),
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: L10n.Alert.General.cancel, style: .cancel) { _ in })
                if let onRetry = onRetry {
                    alert.addAction(UIAlertAction(title: L10n.Alert.General.retry, style: .default) { _ in
                        onRetry()
                    })
                }
                UIApplication.topViewController()?.present(alert, animated: true)
            }
        }
    }
}

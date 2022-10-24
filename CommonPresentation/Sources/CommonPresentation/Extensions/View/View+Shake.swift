import SwiftUI

extension View {
    func shake(shakeTrigger: Bool) -> some View {
        modifier(
            ShakeEffect(shakeTrigger: shakeTrigger)
                .animation(.linear)
        )
    }
}

private struct ShakeEffect {
    var position: CGFloat
    var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }

    // NOTE: This Bool is really just a trigger.
    // Because the View layers are persisting its position,
    // what matters only is the CHANGE in the position.
    init(shakeTrigger: Bool) {
        position = shakeTrigger ? 2 : -2
    }

}

extension ShakeEffect: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(
            translationX: -5 * sin(position * .pi), y: 0)
        )
    }
}

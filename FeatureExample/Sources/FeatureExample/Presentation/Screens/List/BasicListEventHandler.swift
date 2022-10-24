protocol BasicListEventHandler {
    func handleEvent(_ event: BasicListEvent)
}

enum BasicListEvent {
    case itemSelected(Model)
}

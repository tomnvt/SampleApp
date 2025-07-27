# SampleApp

This project shows a possible solution for a complex iOS app. 

### The main principles
- Separation of data, domain, and UI code into separate layers
-- Data layer is responsible for data handling. The caller doesn't know if the data comes from a DB, backend or other data source. It is by default implemented in the `SharedData` package, which can be eventually split into multiple packages if needed.
-- Domain layer implements business logic, e.g. any general data processing that is done in the same way regardless of the platform. A good rule of thumb is that the domain logic could be separated to a Kotlin Multiplatform module. Similarly to data layer code, the domain layer code is implemented `SharedDomain` package, which can be eventually split into multiple packages if needed.
-- UI layer code is separated into the `SharedUI` package and feature packages., `SharedUI` contains the design system elements along with other shared UI related code. Feature packages are functional wholes from the perspective of a user (from a single screen to a series of screens related to each other. Separation into feature packages should reflect the domain driven design of the given product.
- Feature modules have a single entry point provided by the module's Coordinator class. The only feature modules' public type should be:
-- Coordinator class and its `init` and `start`function
-- Dependency types that the module needs for functioning
-- Event or Delegate type/s that inform the parent Coordinator about events, that should handled on the outside
- Data layer contains repositories (e.g. UserRepository, ProductRepository), that serve as the gateway to the data. Data layer also contains data sources (e.g. NetworkDataSource, DatabaseDataSource) that implement actual data operations. Repositories depends on data sources.
- Domain logic is implemented in use cases (a single instance of a business logic rule) or interactor (that aggregate multiple use cases). The data layer dependencies (repositories) are hidden behind protocols, so that other implementations can be easily provided through dependency injection.
- Test should be written for:
-- Every use case and interactor.
-- View models with complex states (where user can interact in various ways that lead to state changes, e.g. a product configurator screen)
-- View models with complex data processing, that Is specific for UI presentation on the given platform (platform independent data processing is already tested in use case and interactor tests).
-- Any other code containing complex logic.

## Considerations:
1. For better testability and debugging, using two binding can be very helpful. All view model published properties can be marked with `private(set)`, so that any state change can happen only through the view model's scope and not from a view through a `Binding` property.
2. For better abstraction, the data layer can define its own models for data handling (e.g. a model for API data, a model for DB data), that can mapped to a domain model, that is then used by the UI layer. Similarly, UI layer can have its own models specific for UI presentation. But it seems practical to create those additional models only when they have a specific data or UI related purpose.
3. For quicker prototyping, other forms of depencency provision can be used (e.g. using a singleton instance or instantiation types in the given scope, like a sub view model that is instantiated in a view). After the prototype phase, the further development should start with refactor into a standard dependency injection.
4. For quicker prototyping, writing tests can be postponed, but not for too long, because of the fading context (the developers hold less information about the feature's inner connections).

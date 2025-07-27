public struct UserProfile {
    public let photoURL: String
    public let userName: String
    public let email: String

    public init(photoURL: String, userName: String, email: String) {
        self.photoURL = photoURL
        self.userName = userName
        self.email = email
    }
}

class InMemoryDatabase {
    
    static let sharedDatabase: InMemoryDatabase = InMemoryDatabase()
    
    private var user: KindlingUser? = nil
    
    private init() {}
    
    var currentUser: KindlingUser {
        get {
            return user!
        }
        set {
            user = newValue
        }
    }
    
    func clear() {
        user = nil
    }
}

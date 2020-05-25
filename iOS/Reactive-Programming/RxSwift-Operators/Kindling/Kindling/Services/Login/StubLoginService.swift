let stubUsers = [
    KindlingUser(
        id: 1,
        username: "abc123",
        emailAddress: "abc123@example.com",
        password: "password1",
        age: 24,
        gender: .female,
        datingPreference: .men,
        imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
        id: 2,
        username: "loveatfirstsight",
        emailAddress: "loveatfirstsight@example.com",
        password: "password1",
        age: 35,
        gender: .male,
        datingPreference: .women,
        imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
        id: 3,
        username: "owen321",
        emailAddress: "owen321@example.com",
        password: "password1",
        age: 35,
        gender: .male,
        datingPreference: .men,
        imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
        id: 3,
        username: "scarlett",
        emailAddress: "scarlett@example.com",
        password: "password1",
        age: 26,
        gender: .female,
        datingPreference: .women,
        imageUrl: "https://picsum.photos/780/1080"
    )
]

class StubLoginService : LoginService {
    
    func login(with credentials: UserLoginCredentials, onResponse: (LoginResult) -> Void) {
        if let user = stubUsers.first(where: { $0.emailAddress == credentials.emailAddress }), user.password == credentials.password {
            InMemoryDatabase.sharedDatabase.currentUser = user
            onResponse(.success)
        } else {
            onResponse(.failure)
        }
    }
}

let stubUsers = [
    KindlingUser(
            id: 1,
            username: "abc123",
            emailAddress: "abc123@example.com",
            password: "password1",
            age: 24,
            gender: .male,
            datingPreference: .women,
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
            id: 4,
            username: "Pamela",
            emailAddress: "PamelaPGuzman@teleworm.us",
            password: "password1",
            age: 20,
            gender: .female,
            datingPreference: .both,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 5,
            username: "Alex",
            emailAddress: "Alex@example.com",
            password: "password1",
            age: 36,
            gender: .male,
            datingPreference: .women,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 6,
            username: "Bonnie",
            emailAddress: "Bonnie@example.com",
            password: "password1",
            age: 44,
            gender: .female,
            datingPreference: .men,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 7,
            username: "Clara",
            emailAddress: "Clara@example.com",
            password: "password1",
            age: 22,
            gender: .female,
            datingPreference: .both,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 8,
            username: "Tom",
            emailAddress: "Tom@example.com",
            password: "password1",
            age: 68,
            gender: .male,
            datingPreference: .women,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 9,
            username: "Tamara",
            emailAddress: "Tamara@example.com",
            password: "password1",
            age: 29,
            gender: .female,
            datingPreference: .men,
            imageUrl: "https://picsum.photos/780/1080"
    ),
    KindlingUser(
            id: 10,
            username: "Dolly",
            emailAddress: "Dolly@example.com",
            password: "password1",
            age: 26,
            gender: .female,
            datingPreference: .both,
            imageUrl: "https://picsum.photos/780/1080"
    )
]

class StubLoginService: LoginService {

    func login(with credentials: UserLoginCredentials, onResponse: (LoginResult) -> Void) {
        if let user = stubUsers.first(where: { $0.emailAddress == credentials.emailAddress }), user.password == credentials.password {
            InMemoryDatabase.sharedDatabase.currentUser = user
            onResponse(.success)
        } else {
            onResponse(.failure)
        }
    }
}

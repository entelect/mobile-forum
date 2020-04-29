enum LoginResult {
    case success
    case failure
}
protocol LoginService {
    func login(with credentials: UserLoginCredentials, onResponse: (_ result: LoginResult) -> Void)
}

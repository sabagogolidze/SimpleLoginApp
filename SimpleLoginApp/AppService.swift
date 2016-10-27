protocol AppService {
    func login(username: String, password: String, success: (Response<LoginResponseContent>) -> Void, fail: ((ServiceError) -> Void))
}

class LoginRequestBuilder: RequestBuilder {
    let PARAM_USERNAME_KEY = "username"
    let PARAM_PASSWORD_KEY = "password"
    var request: Request
    
    init() {
        request = Request()
    }
    
    func addUserNameParam(username: String) -> LoginRequestBuilder {
        request.addParam(key: PARAM_USERNAME_KEY, val: username)
        return self
    }
    
    func addPasswordParam(password: String) -> LoginRequestBuilder {
        request.addParam(key: PARAM_PASSWORD_KEY, val: password)
        return self
    }
    
    func build() -> Request {
        return request
    }
}

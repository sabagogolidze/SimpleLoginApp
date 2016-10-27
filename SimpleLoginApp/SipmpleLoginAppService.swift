class SimpleLoginAppService: AppService {
    
    var appTransport: AppTransport!
    
    init() {
        appTransport = DummyAppTransport()
    }
    
    func login(username: String, password: String, success: (Response<LoginResponseContent>) -> Void, fail: ((ServiceError) -> Void)) {
        let builder = LoginRequestBuilder()
        let req = builder.addUserNameParam(username: username)
            .addPasswordParam(password: password)
            .build();
        appTransport.execute(request: req, success: success, fail: fail)
    }
}

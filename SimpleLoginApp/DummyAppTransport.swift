class DummyAppTransport: AppTransport{
    
    func execute<ContentType>(request: Request, success: (Response<ContentType>) -> Void, fail: ((ServiceError) -> Void)) {
        //THis method is dumm, do not judge :(
        if(ContentType.self == LoginResponseContent.self) {
            if( request.params["username"] == "david" && request.params["password"] == "123" ){
                let content = LoginResponseContent()
                content.loginCount = 10
                let res = Response<ContentType>()
                res.content = (content as! ContentType)
                res.statusCode = 200
                success(res)
            } else {
                let error = ServiceError()
                error.errorCode = 404
                fail(error)
            }
        } else {
            let error = ServiceError()
            error.errorCode = 500
            fail(error)
        }
        
        
    }
    
}

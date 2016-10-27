protocol AppTransport {
    func execute<ContentType>(request: Request, success: (Response<ContentType>) -> Void, fail: ((ServiceError) -> Void))
}

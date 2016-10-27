class Request {
    var params: [String:String]
    
    init(params: [String:String]) {
        self.params = params
    }
    
    init() {
        self.params = [String:String]()
    }
    
    func addParam(key: String, val: String){
        self.params[key] = val
    }
    
}

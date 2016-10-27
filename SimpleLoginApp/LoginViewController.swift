import UIKit

class LoginViewController: FormViewController {
    
    let LOGIN_ERROR_PREFIX = "LOGIN_ERROR_"
    
    
    @IBOutlet weak var userNameTF: ValidateTextField!
    @IBOutlet weak var passwordTF: ValidateTextField!
    
    @IBOutlet weak var englishUnderlineView: UIView!
    @IBOutlet weak var georgianUnderlineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
        underlineLanguage(lang: AppUtils.getUserDefaultLanguage())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: AnyObject) {
        if(!validateInputs()){
            return
        }
        startLoading()
        AppUtils.service().login(username: userNameTF.text!, password: passwordTF.text!, success: successOnLogin, fail: errorOnLogin)
        
    }
    
    func successOnLogin(res: Response<LoginResponseContent>){
        stopLoading()
        emptyFields()
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }
    
    func errorOnLogin(error: ServiceError){
        stopLoading()
        if let code = error.errorCode {
            let errorLocalizedKey = LOGIN_ERROR_PREFIX + "\(code)"
            print(errorLocalizedKey)
            if !(errorLocalizedKey.localized ==  errorLocalizedKey) {
                showOkDialog(title: "", text: errorLocalizedKey.localized)
                return
            }
        }
        showDefaultError()
    }
    
    func emptyFields(){
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    func validateInputs() -> Bool {
        var valid = userNameTF.validate()
        valid = passwordTF.validate() && valid
        return valid
    }
    
    @IBAction func engClick(_ sender: AnyObject) {
        if(AppUtils.getUserDefaultLanguage() == .Eng){
            return
        }
        setLanguage(lang: .Eng)
    }
    
    @IBAction func geoClick(_ sender: AnyObject) {
        if(AppUtils.getUserDefaultLanguage() == .Geo){
            return
        }
        setLanguage(lang: .Geo)
    }
    
    
    
    func setLanguage(lang: Language){
        AppUtils.setLanguage(lang: lang)
        UserDefaults().set(lang.rawValue, forKey: AppUtils.KEY_FOR_SAVING_LANGUAGE)
        AppUtils.translateLocalisedViewsRecursively(view: self.view)
        underlineLanguage(lang: lang)
    }
    
    func underlineLanguage(lang: Language) {
        if(lang == .Geo){
            englishUnderlineView.backgroundColor = UIColor.white
            georgianUnderlineView.backgroundColor = UIColor.lightGray
        }else if(lang == .Eng){
            englishUnderlineView.backgroundColor = UIColor.lightGray
            georgianUnderlineView.backgroundColor = UIColor.white
        }
    }
    
  
    
    
}


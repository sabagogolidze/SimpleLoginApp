import UIKit

class LoginViewController: FormViewController {
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: AnyObject) {
        if(!validateInputs()){
            return
        }
        
        // TODO Login
        
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
        underlineLanguage(lang: .Eng)
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


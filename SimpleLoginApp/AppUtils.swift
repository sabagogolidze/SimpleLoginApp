import UIKit
import CoreData

class AppUtils {
    
    static let KEY_FOR_SAVING_LANGUAGE = "language"
    
    static func bundle() -> Bundle? {
        return (UIApplication.shared.delegate as! AppDelegate).bundle
    }
    
    static func setLanguage(lang: Language){
        (UIApplication.shared.delegate as! AppDelegate).language = lang
    }
    
    static func getUserDefaultLanguage() -> Language{
        var language: Language?
        if let languageKey = UserDefaults.standard.string(forKey: KEY_FOR_SAVING_LANGUAGE) {
            language = Language(rawValue: languageKey)
        }
        return language ?? Language.Geo
    }
    
    static func translateLocalisedViewsRecursively(view: UIView){
        
        for v in view.subviews {
            if v.subviews.count > 0 {
                AppUtils.translateLocalisedViewsRecursively(view: v)
            }
            
            if let localizedView = v as? LocalizationDelegate {
                localizedView.localizeSelf()
            }
            
        }
    }
    
}

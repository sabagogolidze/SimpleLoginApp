import UIKit

enum Language: String{
    case Geo = "ka"
    case Eng = "en"
    
    func locale() -> NSLocale {
        return NSLocale(localeIdentifier: self.rawValue)
    }
}

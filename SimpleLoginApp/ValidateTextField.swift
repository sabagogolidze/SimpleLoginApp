import UIKit

class ValidateTextField: LocalizedTextField {
    @IBInspectable var validateText: String?
    var required: Bool = true

    func validate() -> Bool {
        if ( !self.isValid() ){
            let requireMessage = String(format: "Please fill in".localized, self.validateText?.localized ?? "")
            self.attributedPlaceholder = NSAttributedString(string: requireMessage, attributes: [NSForegroundColorAttributeName: ColorTheme.ErrorTextCollor])
            return false
        }
        return true
    }
    
    func isValid() -> Bool {
        return (!required || !(self.text ?? "").isEmpty)
    }
    
}

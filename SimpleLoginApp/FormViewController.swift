import UIKit

class FormViewController: BaseViewController, UITextFieldDelegate {
    
    weak var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDismissKeyboardRecognisers()
    }
    
    func addDismissKeyboardRecognisers(){
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    
    func dismissKeyboard(){
        self.activeField?.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

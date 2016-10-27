import UIKit

class LocalizedTextField: UITextField, TranslatableView {
    
    @IBInspectable var hintKey: String? {
        didSet {
            localizeSelf()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func localizeSelf() {
        self.placeholder = hintKey?.localized
    }

}

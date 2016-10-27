import UIKit

class LocalizedButton: UIButton, TranslatableView{
    
    var localisedKey: String?
    
    @IBInspectable var key: String? {
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
        self.setTitle(key?.localized, for: .normal)
        
    }
}

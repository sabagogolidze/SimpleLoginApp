import UIKit

class LocalizedLabel: UILabel, TranslatableView{
    
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
        self.text = key?.localized
    }
}

import UIKit

class BaseViewController: UIViewController {
    
    let DEFAULT_ERROR_KEY = "DEFAULT_ERROR"
    var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        initLoadingIndicator()
    }
    
    func initLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        loadingIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        loadingIndicator.center = self.view.center
        self.view.addSubview(loadingIndicator)
        loadingIndicator.bringSubview(toFront: self.view)
    }
    
    func showOkDialog(title: String, text: String){
        let alert = UIAlertController(title:title, message: text, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showDefaultError(){
        showOkDialog(title: "", text: DEFAULT_ERROR_KEY.localized)
    }
    
    func startLoading(){
        loadingIndicator.startAnimating()
    }
    
    func stopLoading(){
        loadingIndicator.stopAnimating()
    }
    
    
    
    
}

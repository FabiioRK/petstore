import UIKit

class LoadingViewController: UIViewController {

    let loadingView = LoadingView()
    
    override func loadView() {
        self.view = loadingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingView.backgroundColor = UIColor(red:246/255,green:199/255,blue:132/255, alpha: 1)
    }
    
    func loadingOff() {
        self.dismiss(animated: true, completion: nil)
    }

}

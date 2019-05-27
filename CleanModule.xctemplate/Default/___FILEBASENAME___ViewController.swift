//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___FILEBASENAME___DisplayLogic: class
{
    func displaySomething(viewModel: ___FILEBASENAME___.Something.ViewModel)
}

class ___FILEBASENAME___ViewController: UIViewController, ___FILEBASENAME___DisplayLogic
{
    var interactor: ___FILEBASENAME___BusinessLogic?
    var router: (NSObjectProtocol & ___FILEBASENAME___RoutingLogic & ___FILEBASENAME___DataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        ___FILEBASENAME___Worker().doSetup(self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ___FILEBASENAME___Worker().doSetup(self)
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = ___FILEBASENAME___.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: ___FILEBASENAME___.Something.ViewModel) {
    }
}


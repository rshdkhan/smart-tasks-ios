//
//  SplashViewController.swift
//  smart-tasks
//
//  Created by Rashid Khan on 07/06/2024.
//

import UIKit

class SplashViewController: UIViewController {
    private var presenter: SplashPresenterType!
    
    convenience init(presenter: SplashPresenterType) {
        self.init()
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindingPresenterOutputs()
        
        presenter.inputs?.viewLoaded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    deinit{
        print("deinit >>> SplashViewController")
    }
}

fileprivate extension SplashViewController {
    func setupViews() { 
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.presenter.inputs?.animationCompleted()
        }
    }
    
    func setupBindingPresenterOutputs() {
        presenter.outputs?.playAnimations = { [weak self] in
            guard let _ = self else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.presenter.inputs?.animationCompleted()
            }
        }
    }
}

//
//  HomeViewWireFrame.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

import UIKit

class HomeViewRouter: NSObject, HomeRouterProtocol {
    let sideTransition = SlideInTransition()
    
    class func createHomeModule() -> UIViewController {
        let view: HomeViewProtocol = HomeViewController()
        let presenter: HomePresenterProtocol & HomeInteracterOutputProtocol = HomePresenter()
        let interacter: HomeInteracterInputProtocol = HomeInteracter()
        let router: HomeRouterProtocol = HomeViewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interacter = interacter
        interacter.presenter = presenter
        
        if let HomeView = view as? UIViewController {
            return HomeView
        }
        return UIViewController()
    }
    
    func presentMemoScreen(from view: HomeViewProtocol, forname name: Model, index: IndexPath) {
        let MemoViewController = MemoViewRouter.createMemoViewRouter(from: name)
        
        if let memoView = view as? UIViewController {
            MemoViewController.modalPresentationStyle = .formSheet
//            MemoViewController.transitioningDelegate = self
            memoView.present(MemoViewController, animated: true)
        }
    }
    func presentSideMenu(from view: HomeViewProtocol) {
        let sideMenuView = SideMenuViewController()
        
        if let sideView = view as? UIViewController {
            sideMenuView.modalPresentationStyle = .overCurrentContext
            sideMenuView.transitioningDelegate = self
            sideView.present(sideMenuView, animated: true)
        }
    }
}

extension HomeViewRouter: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        sideTransition.isPresenting = true
        return sideTransition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        sideTransition.isPresenting = false
        return sideTransition
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}

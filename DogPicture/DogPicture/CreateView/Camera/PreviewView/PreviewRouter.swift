//
//  CaptureRouter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/09/14.
//

import UIKit

class PreviewRouter: PreviewRouterProtocol {
    static func createPreviewModule(forImage data: [Data]) -> UIViewController {
        let view: PreviewViewProtocol = PreviewViewController()
        if let previewView = view as? UIViewController {
            let presenter: PreviewPresenterProtocol & PreviewInteracterOutputProtocol = PreviewPresenter()
            let interacter: PreviewInteracterInputProtocol = PreviewInteracter()
            let router: PreviewRouterProtocol = PreviewRouter()
            
            presenter.view = view
            view.presenter = presenter
            presenter.router = router
            presenter.data = data
            presenter.interacter = interacter
            interacter.presenter = presenter
            
            return previewView
        }
        return UIViewController()
    }
    
    func popPreview(view: PreviewViewProtocol) {
        if let view = view as? UIViewController {
            view.navigationController?.popViewController(animated: true)
        }
    }
    func pushTextEditView(selectedImageData: Data, view: PreviewViewProtocol) {
        let textEditView = TextEditRouter.createTextEditViewModule(selectedPhoto: selectedImageData)
        
        if let preview = view as? UIViewController {
            preview.navigationController?.pushViewController(textEditView, animated: true)
        }
    }
}

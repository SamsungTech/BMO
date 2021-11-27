//
//  HomeViewInteracter.swift
//  DogPicture
//
//  Created by 김동우 on 2021/05/28.
//

class HomeInteracter: HomeInteracterInputProtocol {
    weak var presenter: HomeInteracterOutputProtocol?
    var localDataManager: ModelDatabaseHelperInputProtocol?
    
    var dataHolder: [Model] = []
    
    func retrieveModel() {
        dataHolder = ModelDatabaseHelper.instance.getModelItems()
        presenter?.didRetrieveModel(dataHolder)
    }
}
// LocalDataManager class에서
extension HomeInteracter {
    func onModelRetrieved(models: [Model]) {
        presenter?.didRetrieveModel(models)
    }
}

extension HomeInteracter: ModelDatabaseHelperOutputProtocol {
    
}

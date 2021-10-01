//
//  ListedPresenter.swift
//  todo
//
//  Created by Enes N KENDİRCİ on 30.09.2021.
//

import Foundation

protocol ListedPresenterType {
    
    var view: ListedViewControllerType? {get set}
    var interactor: ListedInteractorType? {get set}
    var router: ListedRouterType? {get set}
    
    func onListedPresenter()
    func onTodosFetched(toDos: [ToDo])
}

class ListedPresenter: ListedPresenterType {
    
    var view: ListedViewControllerType?
    var interactor: ListedInteractorType?
    var router: ListedRouterType?
    
    func onListedPresenter() {
        self.interactor?.fetchTodos()
    }
    
    func onTodosFetched(toDos: [ToDo]) {
        guard let view = self.view else {
            print("listedpresenter -> listedview nil")
            return
        }
        view.onTodosFetched(toDos: toDos)
    }
}

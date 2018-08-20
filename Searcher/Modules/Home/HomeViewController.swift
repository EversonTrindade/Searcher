//
//  HomeViewController.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var presenter: HomeViewToPresenterProtocol = HomePresenter(delegate: self, routerProtocol: self)
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPreviewing()
        presenter.updateView()
    }
    
    func registerForPreviewing() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    
    func showLoaderView() {
        self.showLoader()
    }
    
    func hideLoaderView() {
        self.dismissLoader()
    }

    func didFetchData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func fail(message: String) {
        self.showAlert(message: message, completeBlock: nil)
    }
}

extension HomeViewController: HomePresenterToRouterProtocol {
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CharacterViewCell.self), for: indexPath) as? CharacterViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == presenter.numberOfSections() - 1 && presenter.canLoad {
            presenter.updateFetchedData()
        }
        
        cell.fillCell(dto: presenter.getCharacter(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.presentNextView(with: indexPath.row)
    }
}

extension HomeViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        return UIViewController()
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
}

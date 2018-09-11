//
//  HomeViewController.swift
//  Searcher
//
//  Created by Everson Trindade on 31/07/18.
//  Copyright © 2018 Everson Trindade. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private lazy var presenter: HomeViewToPresenterProtocol = HomePresenter(delegate: self, routerProtocol: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        registerForPreviewing()
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
    
    func didLoadImage(image: UIImage, identifier: Int) {
        DispatchQueue.main.async {
            guard let collection = self.collectionView else {
                return
            }
            for cell in collection.visibleCells {
                if let characterCell = cell as? HomeCell, characterCell.identifier == identifier {
                    characterCell.setImage(with: image)
                }
            }
        }
    }
}

extension HomeViewController: HomePresenterToRouterProtocol {
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCell.self), for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == presenter.numberOfSections() - 1 && presenter.canLoad {
            presenter.updateFetchedData()
        }
        
        cell.fillCell(dto: presenter.getCharacter(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let characterCell = cell as? HomeCell {
            characterCell.fillCell(dto: presenter.getCharacter(at: indexPath.row))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.presentNextView(with: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5.0, 2.0, 5.0, 2.0)
    }
}

extension HomeViewController: HomeCellDelegate {
    
    func didFavorite(with id: Int, shouldFavorite: Bool, imageData: Data?) {
        presenter.didFavorite(with: id, shouldFavorite: shouldFavorite, imageData: imageData)
    }
}

extension HomeViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        return UIViewController()
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
}

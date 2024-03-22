//
//  GradeView.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import UIKit

private struct GradeViewConstants {
    static let cellLayoutItemWidth = 350
    static let cellLayoutItemHeight = 70
    static let itemSpacing: CGFloat = 20
    static let cellId = String(describing: GradeCell.self)
}

final class GradeView: UIViewController {
    private let gradeViewModel = GradeViewModel()
    //MARK: UI elements
    private let gradeCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .viewBackgroundColor
        cv.register(UINib(nibName: GradeViewConstants.cellId, bundle: nil), forCellWithReuseIdentifier: GradeViewConstants.cellId)
        cv.allowsSelection = true
        return cv
        
    }()
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackgroundColor
        setupCollectionLayout(collection: gradeCollection)
        setupCollectionDataSource()
        setupLayout()
        setupConstraints()
    }
    //MARK: Private methods
    private func setupCollectionDataSource() {
        gradeCollection.delegate = self
        gradeCollection.dataSource = self
    }
    private func setupCollectionLayout(collection: UICollectionView) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: GradeViewConstants.cellLayoutItemWidth, height: GradeViewConstants.cellLayoutItemHeight)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = GradeViewConstants.itemSpacing
        collection.collectionViewLayout = flowLayout
    }
    private func setupLayout() {
        [gradeCollection].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gradeCollection.topAnchor.constraint(equalTo: view.topAnchor),
            gradeCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradeCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradeCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    private func showAlert(error: String) {
        let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    private func pushVC() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: UICollectionViewDataSource methods
extension GradeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gradeViewModel.gradesArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GradeCell.identifier, for: indexPath) as? GradeCell else {
            return UICollectionViewCell()
        }
        cell.gradeLabel.text = gradeViewModel.gradesArr[indexPath.item]
        let selection = cell.isSelected
        cell.configureCell(isSelected: selection)
        return cell
    }
    
}
//MARK: UICollectionViewDelegate methods
extension GradeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? GradeCell
        let selectedGrade = indexPath.row + 1
        cell?.configureCellSelected()
        self.gradeViewModel.fetchBooks(grade: selectedGrade) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.pushVC()
                case .failure(let error):
                    self.showAlert(error: error.localizedDescription)
                }
            }
        }
    }
}


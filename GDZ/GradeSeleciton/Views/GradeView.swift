//
//  GradeView.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import UIKit

final class GradeView: UIViewController {
    //MARK: UI elements
    private let gradeCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .viewBackgroundColor
        cv.register(UINib(nibName: "GradeCell", bundle: nil), forCellWithReuseIdentifier: "GradeCell")
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
        gradeCollection.dataSource = self
    }
    private func setupCollectionLayout(collection: UICollectionView) {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 350, height: 70)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 5
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
    
}
//MARK: Collection view data source methods
extension GradeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GradeCell.identifier, for: indexPath) as! GradeCell
        return cell
    }
}

//
//  GradeCell.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import UIKit

class GradeCell: UICollectionViewCell {
    static let identifier = "GradeCell"

    @IBOutlet weak var gradeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellLayer()
    }
    private func setupCellLayer() {
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.bookTitleTextColor.cgColor
    }

}

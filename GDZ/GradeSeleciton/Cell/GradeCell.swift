//
//  GradeCell.swift
//  GDZ
//
//  Created by Дмитрий on 14.03.2024.
//

import UIKit

private struct GradeCellConstants {
    static let cellCornerRadius: CGFloat = 10
    static let cellBorderWidth: CGFloat = 1.0
}

final class GradeCell: UICollectionViewCell {
    static let identifier = "GradeCell"
    //MARK: UI elements
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var gradeLabel: UILabel!
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        activityIndicator.isHidden = true
        setupCellLayer()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        backgroundColor = UIColor.clear
        gradeLabel.textColor = UIColor.buyButtonColor
        isSelected = false
    }
    //MARK: Methods
    private func setupCellLayer() {
        layer.cornerRadius = GradeCellConstants.cellCornerRadius
        layer.borderWidth = GradeCellConstants.cellBorderWidth
        layer.borderColor = UIColor.bookTitleTextColor.cgColor
    }
    func configureCell(isSelected: Bool) {
        if isSelected {
            configureCellSelected()
        } else {
            prepareForReuse()
        }
    }

    func configureCellSelected() {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            backgroundColor = UIColor.buyButtonColor
            gradeLabel.textColor = UIColor.white
    }
    
}

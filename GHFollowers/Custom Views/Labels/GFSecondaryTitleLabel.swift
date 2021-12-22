//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/17/21.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(size: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: size, weight: .medium)
        configure()
    }
    
    
    //MARK: - Helpers
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

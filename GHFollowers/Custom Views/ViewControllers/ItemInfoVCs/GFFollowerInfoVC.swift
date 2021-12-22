//
//  GFFollowerInfoVC.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/18/21.
//

import UIKit

class GFFollowerInfoVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGetFollowers(for: user)
    }
    
}

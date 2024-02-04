//
//  VerticalFlowLayout.swift
//  UpcomingMovies
//
//  Created by Alonso on 3/9/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

final class VerticalFlowLayout: UICollectionViewFlowLayout {
    private var preferredWidth: CGFloat
    private var preferredHeight: CGFloat
    private let margin: CGFloat
    private let minColumns: Int

    init(preferredWidth: CGFloat,
         preferredHeight: CGFloat,
         margin: CGFloat = 0,
         minColumns: Int = 1) {
        self.preferredWidth = preferredWidth
        self.preferredHeight = preferredHeight
        self.margin = margin
        self.minColumns = minColumns
        super.init()

        sectionInsetReference = .fromSafeArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func prepare() {
        super.prepare()

        var finalWidth = preferredWidth
        var finalHeight = preferredHeight
        if minColumns != .zero, let collectionView = collectionView {
            let totalHorzontalSafeAreaInset = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
            let horizontalSpacePerItem = margin * 2 + totalHorzontalSafeAreaInset + minimumInteritemSpacing
            let totalHorizontalSpace = horizontalSpacePerItem
            let maximumItemWidth = ((collectionView.bounds.size.width - totalHorizontalSpace) / CGFloat(minColumns)).rounded(.down)
            finalWidth = maximumItemWidth
            finalHeight = finalWidth * (preferredHeight / preferredWidth)
        }
        itemSize = CGSize(width: finalWidth, height: finalHeight)
        sectionInset = UIEdgeInsets(top: margin, left: margin,
                                    bottom: margin, right: margin)
    }

    func updatePreferredWidth(_ width: CGFloat) {
        self.preferredWidth = width
    }

    func updatePreferredHeight(_ height: CGFloat) {
        self.preferredHeight = height
    }
}

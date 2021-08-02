//
//  CollectionViewCell.swift
//  CalculatorWithColletionView
//
//  Created by IwasakIYuta on 2021/08/02.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
   var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 33)
        label.backgroundColor = .systemGray
        label.clipsToBounds = true //cellからはみ出さないようにする
        return label
    }()
    override init(frame: CGRect) { //初期化した時に呼ばれる所
        super.init(frame: frame)
        addSubview(numberLabel)//addSubview(UIView)でVIewにラベルを表示することができる
        numberLabel.frame.size = self.frame.size //numberLabelのサイズをセルのフレームと同じにする
        numberLabel.layer.cornerRadius = self.frame.height / 2
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

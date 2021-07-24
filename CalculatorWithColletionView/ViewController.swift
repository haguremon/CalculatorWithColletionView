//
//  ViewController.swift
//  CalculatorWithColletionView
//
//  Created by IwasakIYuta on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    //cellに配置するするやつ
    let calculatorScreen = [
        ["AC","+/-","%","÷"],
        ["7","8","9","×"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".","="]
    
    ]
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        view.backgroundColor = .systemGreen
        numberLabel.font = .boldSystemFont(ofSize: 70)
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { //UICollectionViewDelegateFlowLayoutでレイアウトを作成することができる
    //セッションの間のHeaderの大きさとかを決める
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: collectionView.frame.width, height: 10)
    }
    //sizeForItemAtでcollectionViewのせるの大きさを決める
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        return .init(width: width, height: width)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return calculatorScreen.count //5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calculatorScreen[section].count//section毎の数
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        //まずセクションを選んでそれのロウを指定しする
        cell.numberLabel.text = calculatorScreen[indexPath.section][indexPath.row]
        // cell.backgroundColor = .link
        return cell
    }
    
    
    

}


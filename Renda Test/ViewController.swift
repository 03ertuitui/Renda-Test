//
//  ViewController.swift
//  Renda Test
//
//  Created by 伊藤あかり on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var tapButton: UIButton!
    
    var Count:Int = 0
    let firestore = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firestore.collection("counts").document("share").getDocument { snapshot, error in
                    if error != nil {
                        print("エラーが発生しました")
                        print(error)
                        return
                    }
                    let data = snapshot?.data()
                    if data == nil {
                        print("データがありません")
                        return
                    }
                    let count = data!["count"] as? Int
                    if count == nil {
                        print("countという対応する値がありません")
                        return
                    }
                    self.tapCount = count!
                    self.countLabel.text = String(count!)
                }
            }
        
    
@IBAction func taptapButoon(){
        
        
       Count = Count + 1
        
        countLabel.text = String(Count)
        
        firestore.collection("counts").document("share").setData(["count": Count])
    }

}

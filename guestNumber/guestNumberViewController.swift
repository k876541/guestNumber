//
//  guestNumberViewController.swift
//  guestNumber
//
//  Created by Ryan Chang on 2021/3/28.
//

import UIKit


class guestNumberViewController: UIViewController {

    @IBOutlet weak var minNumberLabel: UILabel!
    @IBOutlet weak var maxNumberLabel: UILabel!
    @IBOutlet weak var guestNumberTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    
    //宣告最大數值 最小數值 以及隨機數
    var times = 5
    var max = 100
    var min = 1
    var rightnumber = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        timesLabel.text = "次數剩下：\(times)"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func guestButton(_ sender: UIButton) {
        //收鍵盤
//        view.endEditing(true)
        
        //判斷輸入的數字是不是數字
        if let guesstext = guestNumberTextField.text,
           let guess = Int(guesstext){
            //在playground偷偷列印答案
            print(rightnumber)
            
            
            if guess > max || guess < min {
                statusLabel.text = "超過範圍，\n請輸入數字\(min)~\(max)"
                times -= 1
                timesLabel.text = "次數剩下：\(times)"
            }else if guess > rightnumber {
                max = guess
                statusLabel.text = "太大了"
                maxNumberLabel.text = "最大值:\(guess)"
                times -= 1
                timesLabel.text = "次數剩下：\(times)"
            }else if guess < rightnumber{
                min = guess
                statusLabel.text = "太小了"
                minNumberLabel.text = "最小值:\(guess)"
                times -= 1
                timesLabel.text = "次數剩下：\(times)"
            }else if guess == rightnumber {
                finish("恭喜你！")
            }
            if times == 0{
                finish("沒機會啦！")
            }
        }
        //輸入完之後則會清空textfield
        guestNumberTextField.text = ""
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    
    
    @IBAction func tapNumber(_ sender: UITextField) {
    }
    
    //重置數據的func
    func reset()  {
        times = 5
        max = 100
        min = 0
        rightnumber = Int.random(in: min...max)
        guestNumberTextField.text = ""
        minNumberLabel.text = "最小值:\(min)"
        maxNumberLabel.text = "最大值:\(max)"
        statusLabel.text = "猜數字"
        timesLabel.text = "次數剩下：\(times)"
    }
    
    //當猜對或猜錯都是呼叫 alart來宣告結果，並且點擊“ＯＫ”後會重置遊戲
    func finish(_ title:String) {
        let alart = UIAlertController(title: title, message: "答案是\(rightnumber)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Again", style: .default, handler: { action in self.reset() })
        //呼叫alart
        alart.addAction(action)
        present(alart, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

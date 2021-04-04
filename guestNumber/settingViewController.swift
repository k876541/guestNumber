//
//  settingViewController.swift
//  guestNumber
//
//  Created by Ryan Chang on 2021/3/30.
//

import UIKit



class settingViewController: UIViewController {

    @IBOutlet weak var maxNumberLabel: UITextField!
    @IBOutlet weak var minnumberLabel: UITextField!
    @IBOutlet weak var timesLabel: UITextField!
    
    @IBOutlet weak var OKButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var maxnumber = Int()
    var minnumber = Int()
    var times = Int()
    
    @IBSegueAction func settingSegueAction(_ coder: NSCoder) -> guestNumberViewController? {
        let controller = guestNumberViewController(coder: coder)
        controller?.max = maxnumber
        controller?.min = minnumber
        controller?.times = times
        
        return guestNumberViewController(coder: coder)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
           
    @IBAction func settingButton(_ sender: UIButton) {
    
        if let bigtext = maxNumberLabel.text,
           let smalltext = minnumberLabel.text,
           let tstext = timesLabel.text,
           let bigNumber = Int(bigtext),
           let smallNumber = Int(smalltext),
           let tt = Int(tstext){
            
            if bigNumber <= smallNumber || tt <= 0{
                print("最大值 最小值 或是次數不正確 不正確")
            }
//            performSegue(withIdentifier: "setting", sender: nil)
        }
        print("請輸入數字")
    }
    
    

    @IBAction func resetButton(_ sender: UIButton) {
        maxnumber = 100
        minnumber = 0
        times = 5
        maxNumberLabel.text = String(maxnumber)
        minnumberLabel.text = String(minnumber)
        timesLabel.text = String(times)
        
        
    }
    
    
//    var time = timer()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

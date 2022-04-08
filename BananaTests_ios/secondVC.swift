//
//  secondVC.swift
//  Muslimbek.Test
//
//  Created by Macbook on 18/12/21.
//

import UIKit

class secondVC: UIViewController {
    
    @IBOutlet weak var restartButton: UIButton!
    
    
    @IBOutlet weak var HomeButton: UIButton!
    
    
    @IBOutlet weak var asosiyYopiladiganview: UIView!
    
    @IBOutlet var bananLabel: [UILabel]!
    @IBOutlet var yozuvLabel: [UILabel]!
    
    @IBOutlet var banansOne: [UIImageView]!
    
    
    @IBOutlet var banansTwo: [UIImageView]!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet var answerButton: [UIButton]!
    
    
    @IBOutlet var restartHomeButton: [UIButton]!
    
    
    
    @IBOutlet weak var natijaLabel: UILabel!
    
    
    
    var data: [QuestionDM] = []
    var current_question  = 0
    var correctAnswerCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [QuestionDM(a_son: 2 , b_son: 3, correctAnsver: "\(5)",variantss: ["\(5)", "\(7)", "\(3)", "\(8)"] ),
                QuestionDM(a_son: 1 , b_son: 4, correctAnsver: "\(5)",variantss: ["\(5)", "\(7)", "\(3)", "\(8)"] ),
                QuestionDM(a_son: 4 , b_son: 4, correctAnsver: "\(2)",variantss: ["\(5)", "\(7)", "\(8)", "\(2)"] ),
                QuestionDM(a_son: 1 , b_son: 3, correctAnsver: "\(6)",variantss: ["\(5)", "\(4)", "\(6)", "\(8)"] ),
                QuestionDM(a_son: 4 , b_son: 3, correctAnsver: "\(3)",variantss: ["\(5)", "\(7)", "\(3)", "\(8)"] )]
        setSavol()
        asosiyYopiladiganview.isHidden = true
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        for j in yozuvLabel {
            j.layer.cornerRadius = 20
            j.clipsToBounds = true
        }
        for i in bananLabel{
            i.layer.shadowColor = UIColor.white.cgColor
            i.layer.shadowOpacity = 1
            i.layer.shadowOffset = CGSize(width: 5, height: -5)
        }
        
        for d in answerButton{
            d.layer.cornerRadius = 20
        }
        
        for o in restartHomeButton{
            o.layer.cornerRadius = 10
        }
       
    }
    
    
    
    @IBAction func VaiantButtonTup(_ sender: UIButton) {
        
        if data[current_question].variantss[sender.tag] == data[current_question].correctAnsver {
            answerButton[sender.tag].backgroundColor = .green
            correctAnswerCount += 1
            }
        
        else {
           answerButton[sender.tag].backgroundColor = .red
            
//            for d in data[current_question].variantss.enumerated(){
//                if data[current_question].variantss[d.offset] == data[current_question].correctAnsver {
//                    answerButton[d.offset].backgroundColor = .green
//                }
//            }
            
            }
//        playSound(sound: "dilin", type: "mp3")
        for l in answerButton {
        l.isUserInteractionEnabled = false
    }
        
        
        
    }
    
    
    @IBAction func restartTup(_ sender: UIButton) {
        
        correctAnswerCount = 0
        current_question = 0
        setSavol()
        
    }
    
    
    @IBAction func HomeButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func nextButtonTup(_ sender: UIButton) {
        current_question += 1
        setSavol()
        for i in answerButton{
            i.backgroundColor = #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 0)
            i.isUserInteractionEnabled = true
        }
        
        
    }
    
    
    
    
    
    func setSavol(){
     
        if current_question < data.count{
        
            for i in answerButton.enumerated() {
                i.element.setTitle("\(data[current_question].variantss[i.offset])", for: .normal)
            }
            
            for k in 0..<banansOne.reversed().count {
                if k < data[current_question].a_son {
                    banansOne[k].isHidden = true
                }
                else {
                    banansOne[k].isHidden = false
                }
            }
            
            
            for y in 0..<banansTwo.reversed().count {
                if y < data[current_question].b_son {
                    banansTwo[y].isHidden = true
                }
                else {
                    banansTwo[y].isHidden = false
                }
            }
            
        }else {
            print("ELSE IHSLADI")
            asosiyYopiladiganview.isHidden = false
            natijaLabel.text = "\(correctAnswerCount) / \(5)"
        
        }
    
    }

}

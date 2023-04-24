//
//  ViewController.swift
//  CounterApp
//
//  Created by Эльдар Айдумов on 23.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    var count = 0
    
    private func dateFunction () -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let date = dateFormatter.string(from: today)
        
        return date
    }
    
    private func scrollFunction () {
        counterLabel.text = "Значение счётчика: \(count)"
        let range = NSMakeRange(textView.text.count - 1, 0)
        textView.scrollRangeToVisible(range)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(count)"
        counterButton.setTitle("Let's count!", for: .normal)
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        trashButton.tintColor = .systemOrange
        
        textView.isEditable = false
        textView.isSelectable = false
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        textView.backgroundColor = .clear
        textView.text = "История изменений:\n\n"
        
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        
        print ("Кнопка счётчика нажата \(count) раз(а).")
    }

    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        count += 1
        textView.insertText("\(dateFunction()): значение изменено на +1.\n")
        
        scrollFunction()
        
        print ("Нажата кнопка плюс.")
    }
    
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        if count <= 0 {
            count = 0
            textView.insertText("\(dateFunction()): попытка уменьшить значение счётчика меньше 0.\n")
            print ("Нажата кнопка минус (невозможно уменьшить значение).")
        } else {
            count -= 1
            textView.insertText("\(dateFunction()): значение изменено на -1.\n")
            print ("Нажата кнопка минус.")
        }
        
        scrollFunction()
    }
    
    @IBAction func trashButton(_ sender: UIButton) {
        count = 0
        textView.insertText("\(dateFunction()): значение счётчика сброшено.\n")
        
        scrollFunction()
        
        print ("Нажата кнопка обнуления счётчика.")
    }
}

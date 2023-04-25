//
//  ViewController.swift
//  CounterApp
//
//  Created by Эльдар Айдумов on 23.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterButton: UIButton!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var trashButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    var count = 0
    
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
    
    private func getDateString () -> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let date = dateFormatter.string(from: today)
        
        return date
    }
    
    private func scrollToEnd () {
        counterLabel.text = "Значение счётчика: \(count)"
        let range = NSMakeRange(textView.text.count - 1, 0)
        textView.scrollRangeToVisible(range)
    }
    
    @IBAction private func buttonDidTap(_ sender: UIButton) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        
        print ("Кнопка счётчика нажата \(count) раз(а).")
    }

    @IBAction private func plusButtonDidTap(_ sender: UIButton) {
        count += 1
        textView.insertText("\(getDateString()): значение изменено на +1.\n")
        
        scrollToEnd()
        
        print ("Нажата кнопка плюс.")
    }
    
    @IBAction private func minusButtonDidTap(_ sender: UIButton) {
        if count <= 0 {
            count = 0
            textView.insertText("\(getDateString()): попытка уменьшить значение счётчика меньше 0.\n")
            print ("Нажата кнопка минус (невозможно уменьшить значение).")
        } else {
            count -= 1
            textView.insertText("\(getDateString()): значение изменено на -1.\n")
            print ("Нажата кнопка минус.")
        }
        
        scrollToEnd()
    }
    
    @IBAction private func trashButton(_ sender: UIButton) {
        count = 0
        textView.insertText("\(getDateString()): значение счётчика сброшено.\n")
        
        scrollToEnd()
        
        print ("Нажата кнопка обнуления счётчика.")
    }
}

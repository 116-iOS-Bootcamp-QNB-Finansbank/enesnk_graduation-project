//
//  DetailViewController.swift
//  todo
//
//  Created by Enes N KENDİRCİ on 1.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var todoId: Int?
    
    @IBOutlet weak var detailScreenTitle: UILabel!
    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var datePicker: UITextField!
    
    @IBOutlet var colorButtons: [UIButton]!
    
    override func viewDidLoad() {
        createDatePicker()
        setScreenTitle()
        super.viewDidLoad()
    }

    init(todoId id: Int?) {
        self.todoId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func colorButtonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = UIColor().TagToColor(tag: sender.tag)
        }
        for colorButton in colorButtons {
            colorButton.setImage(UIImage(systemName: DetailColorPickerImages.unselected.rawValue), for: .normal)
        }
        sender.setImage(UIImage(systemName: DetailColorPickerImages.selected.rawValue), for: .normal)
    }
    
    private func setScreenTitle(){
        guard let todoId = todoId else {
            detailScreenTitle.text = "Add To-Do"
            return
        }
        //when detail-screen opened from tablecell
        detailScreenTitle.text = String(todoId)
    }
    
    private let picker = UIDatePicker()
    private func createDatePicker() {
        picker.datePickerMode = .dateAndTime
        picker.minimumDate = Date()
        picker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let clearButton = UIBarButtonItem(barButtonSystemItem: .trash, target: nil, action: #selector(undoClicked))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([clearButton, space, doneButton], animated: true)
        datePicker.inputAccessoryView = toolbar
        datePicker.inputView = picker
    }
    @objc private func undoClicked(){
        datePicker.text = ""
        self.view.endEditing(true)
    }
    
    @objc private func doneClicked(){
        datePicker.text = picker.date.dateToString()
        self.view.endEditing(true)
    }

}

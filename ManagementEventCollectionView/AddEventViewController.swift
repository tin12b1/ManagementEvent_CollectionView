//
//  AddEventViewController.swift
//  ManagementEventCollectionView
//
//  Created by Cntt02 on 5/6/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    lazy var eventLines: [EventLine] = {
        return EventLine.eventLines()
    }()
    
    let weekDays = ["Monday", "Tuesday", "Wedneday", "Thusday", "Friday", "Saturday", "Sunday"]
    var day = 0
    var keyboardIsShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(AddEventViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddEventViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekDays[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekDays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        day = row
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let eventLine = eventLines[day]
        eventLine.events.append(Event(titled: txtTitle.text!, description: txtDescription.text!, image: #imageLiteral(resourceName: "default")))
        print("Add Success")
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnCancel(_ sender: Any) {
    }

    func keyboardWillShow(notification:NSNotification) {
        if !keyboardIsShow {
            adjustingHeight(show: true, notification: notification)
            keyboardIsShow = true
        }
    }
    
    func keyboardWillHide(notification:NSNotification) {
        if keyboardIsShow {
            adjustingHeight(show: false, notification: notification)
            keyboardIsShow = false
        }
        
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        let changeInHeight = (keyboardFrame.height) * (show ? 1 : -1)
        
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
        })
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

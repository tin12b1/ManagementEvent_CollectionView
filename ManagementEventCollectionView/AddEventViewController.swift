//
//  AddEventViewController.swift
//  ManagementEventCollectionView
//
//  Created by Cntt12 on 5/13/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {

    @IBOutlet var txtDescription: UITextView!
    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var lblDay: UILabel!
    
    @IBOutlet var btmConstraint: NSLayoutConstraint!
    
    var keyboardIsShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Event"
        lblDay.text = dayOfWeek()
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddEventViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddEventViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if txtTitle.text!.isEmpty || txtDescription.text!.isEmpty {
            // Thong bao nhap thieu thong tin
            let alert = UIAlertController(title: "Error", message: "Missing Information!", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }
        else {
            TempEvent.check = true
            let event: Event = Event(titled: txtTitle.text!, description: txtDescription.text!, image: #imageLiteral(resourceName: "default"))
            TempEvent.event = event
            TempEvent.day = getDayOfWeek(currentDate()!)! - 1
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func currentDate() -> String? {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: currentDate)
        return date
    }
    
    func dayOfWeek() -> String? {
        let day = getDayOfWeek(currentDate()!)
        if day == 1 {
            return "Sunday"
        } else if day == 2 {
            return "Monday"
        } else if day == 3 {
            return "Tuesday"
        } else if day == 4 {
            return "Wednesday"
        } else if day == 5 {
            return "Thusday"
        } else if day == 6 {
            return "Friday"
        } else {
            return "Saturday"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtTitle.resignFirstResponder()
        txtDescription.resignFirstResponder()
        return true
    }
    
    @IBAction func userTappedBackground(sender: AnyObject){
        txtTitle.resignFirstResponder()
        txtDescription.resignFirstResponder()
    }
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        
        //Nếu keyboard đã mơ rồi thì không thực hiện đẩy nữa
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
    
    //thay đổi thông số của constrant bottomConstraint để nó nằm trên bàn phím ảo
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        let changeInHeight = (keyboardFrame.height) * (show ? 1 : -1)
        
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            self.btmConstraint.constant += changeInHeight
        })
        
    }


}

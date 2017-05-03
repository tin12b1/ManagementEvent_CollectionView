//
//  EventDetailViewController.swift
//  ManagementEventCollectionView
//
//  Created by Tran Van Tin on 5/3/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var lblDay: UILabel!
    @IBOutlet var txtDescrition: UITextView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var eventImageView: UIImageView!
    
    var event: Event?
    var day: String?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        lblDay.text = day
        eventImageView.image = event?.image
        lblTitle.text = event?.title
        txtDescrition.text = event?.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

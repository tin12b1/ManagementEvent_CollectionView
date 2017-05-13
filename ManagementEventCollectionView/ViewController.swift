//
//  ViewController.swift
//  ManagementEventCollectionView
//
//  Created by Tran Van Tin on 5/2/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var MyCollectionView: UICollectionView!
    
    lazy var eventLines: [EventLine] = {
        return EventLine.eventLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.MyCollectionView.delegate = self
        self.MyCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return eventLines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let eventLine = eventLines[section]
        return eventLine.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! MyCollectionViewCell
        
        let eventLine = eventLines[indexPath.section]
        let event = eventLine.events[indexPath.row]
        
        cell.myImageView.image = event.image
        cell.lblTitle.text = event.title
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! SectionHeaderView
        
        let eventLine = eventLines[indexPath.section]
        headerView.lblHeader.text = eventLine.day
        
        return headerView
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Xoá event
        let questionController = UIAlertController(title: "What you want to do?", message: nil, preferredStyle: .alert)
        questionController.addAction(UIAlertAction(title: "Delete Event", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            print("Delete")
            let eventLine = self.eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            self.MyCollectionView.deleteItems(at: [indexPath])
        }))
        // Thông tin chi tiết event
        questionController.addAction(UIAlertAction(title: "Event Detail", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            print("Event Detail")
            let eventLine = self.eventLines[indexPath.section]
            let event = eventLine.events[indexPath.row]
            let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventDetail") as! EventDetailViewController
            detailVC.day = eventLine.day
            detailVC.event = event
            self.navigationController?.pushViewController(detailVC, animated: true)
        }))
        
        questionController.addAction(UIAlertAction(title: "Reload", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            print("Reload")
            self.MyCollectionView.reloadData()
        }))
        
        present(questionController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Thêm event
        if TempEvent.check {
            let eventLine = eventLines[TempEvent.day]
            eventLine.events.append(TempEvent.event)
            MyCollectionView.reloadData()
            TempEvent.check = false
        }
        super.viewWillAppear(true)
    }

}


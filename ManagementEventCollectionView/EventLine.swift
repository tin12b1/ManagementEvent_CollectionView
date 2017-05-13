//
//  EventLine.swift
//  ManagementEvents
//
//  Created by Tran Van Tin on 4/26/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import Foundation
import UIKit

class EventLine
{
    var day: String         //các ngày trong tuần
    var events: [Event]     //các sự kiện trong ngày
    
    init(daysOfWeek: String, includeEvents: [Event])
    {
        day = daysOfWeek
        events = includeEvents
    }
    
    class func eventLines() -> [EventLine]
    {
        return [self.Sunday(), self.Monday(), self.Tuesday(), self.Wednesday(), self.Thusday(), self.Friday(), self.Saturday()]
    }
    
    private class func Monday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Reading Books", description: "Đọc thật nhiều sách!", image: #imageLiteral(resourceName: "book")))
        events.append(Event(titled: "Going to school", description: "Go to school to learn English", image: #imageLiteral(resourceName: "school")))
        events.append(Event(titled: "Doing homeworks", description: "So much homework to complete", image: #imageLiteral(resourceName: "homework")))
        
        return EventLine(daysOfWeek: "Monday", includeEvents: events)
        //các sự kiện cho ngày Thứ Hai
    }
    
    private class func Tuesday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Reading Comics", description: "Read One Piece, Naruto", image: #imageLiteral(resourceName: "comic")))
        events.append(Event(titled: "Going to New Star", description: "Go to New Star to learn CCNA", image: #imageLiteral(resourceName: "newstar")))

        return EventLine(daysOfWeek: "Tuesday", includeEvents: events)
        //các sự kiện cho ngày Thứ Ba
    }
    
    private class func Wednesday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Visit a friend", description: "Go to Bien Hoa City to meet a friend", image: #imageLiteral(resourceName: "friend")))
        events.append(Event(titled: "Have lunch", description: "Have lunch at Lotte Mart Pham Van Thuan", image: #imageLiteral(resourceName: "lunch")))
        events.append(Event(titled: "Repair PC", description: "Repair girlfriend's Personal Computer", image: #imageLiteral(resourceName: "pcrepair")))
        events.append(Event(titled: "Sleep", description: "Go to bed after a long day", image: #imageLiteral(resourceName: "sleep")))
        
        return EventLine(daysOfWeek: "Wednesday", includeEvents: events)
        //các sự kiện cho ngày Thứ Tư
    }
    
    private class func Thusday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Have breakfast", description: "Have a breakfast with bread", image: #imageLiteral(resourceName: "breakfast")))
        events.append(Event(titled: "Going to school", description: "Go to school to learn Operating System", image: #imageLiteral(resourceName: "school")))
        events.append(Event(titled: "Backup Website", description: "Back up company's website", image: #imageLiteral(resourceName: "backup")))
        
        return EventLine(daysOfWeek: "Thusday", includeEvents: events)
        //các sự kiện cho ngày Thứ Năm
    }
    
    private class func Friday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Friend's Wedding", description: "Linh's Wedding at Queen Plaza", image: #imageLiteral(resourceName: "wedding")))
        events.append(Event(titled: "Buy something", description: "Go to Co.op Mart to buy something", image: #imageLiteral(resourceName: "buy")))
        
        return EventLine(daysOfWeek: "Friday", includeEvents: events)
        //các sự kiện cho ngày Thứ Sáu
    }
    
    private class func Saturday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Go to school", description: "Go to HCMUTE to learn iOS Dev", image: #imageLiteral(resourceName: "school")))
        events.append(Event(titled: "Meeting", description: "Online meeting with Boss", image: #imageLiteral(resourceName: "meeting")))
        events.append(Event(titled: "Watch Movie", description: "Go to CGV cinema to watch Spiderman", image: #imageLiteral(resourceName: "movie")))
        
        return EventLine(daysOfWeek: "Saturday", includeEvents: events)
        //các sự kiện cho ngày Thứ Bảy
    }
    
    private class func Sunday() -> EventLine
    {
        var events = [Event]()
        
        events.append(Event(titled: "Sleep", description: "Sleep to 12:00pm", image: #imageLiteral(resourceName: "sleep")))
        events.append(Event(titled: "Take a shower", description: "Take a shower at Paradise", image: #imageLiteral(resourceName: "takeashower")))
        events.append(Event(titled: "Have dinner", description: "Have dinner with my honney", image: #imageLiteral(resourceName: "dinner")))
        
        return EventLine(daysOfWeek: "Sunday", includeEvents: events)
        //các sự kiện cho ngày Chủ Nhật
    }
}

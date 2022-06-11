//
//  NotificationViewController.swift
//  NContentExtenstion
//
//  Created by Azizbek Salimov on 07.06.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import SwiftUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet weak var doctorsImageView: UIImageView!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var informationLbl: UILabel!
    @IBOutlet weak var doctorNameSurnamelbl: UILabel!
    @IBOutlet weak var infoEditionalLbl: UILabel!
    @IBOutlet weak var doctorPhoneLbl: UILabel!
    @IBOutlet weak var subServiceImg: UIImageView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    
    var info = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        
        
        
        let content = notification.request.content
        let userInfo = notification.request.content.userInfo
        titleLbl.text = "Positive Massage"
        
//        dateLbl.text = userInfo["meetingDay"] as! String
//        infoEditionalLbl.text = "at"
//        timeLbl.text = userInfo["meetingTime"] as! String
        doctorNameSurnamelbl.text = userInfo["ownerName"] as! String
        doctorPhoneLbl.text = userInfo["phone"] as! String
        getImage(imageM: logoImage, key: (userInfo["logo"] as! String))
        getImage(imageM: doctorsImageView, key: (userInfo["userImg"] as! String))
        getImage(imageM: subServiceImg, key: (userInfo["subServiceImg"] as! String))
        
        
        if userInfo["accepted"] as! String == "true" {
            info =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has booked you for the reception on \(userInfo["meetingDay"] as! String) at  \(userInfo["meetingTime"] as! String)"
            statusView.backgroundColor = #colorLiteral(red: 0, green: 0.9281212687, blue: 0.5735446811, alpha: 1)
            statusLbl.text = "You have been accepted!"
        } else {
            info =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has not booked you for the reception on \(userInfo["meetingDay"] as! String) at  \(userInfo["meetingTime"] as! String)"
            statusView.backgroundColor = #colorLiteral(red: 0.6353749633, green: 0, blue: 0.2125297487, alpha: 1)
            statusLbl.text = "You were not accepted!"
        }
        setMessageText(textBold: (userInfo["meetingDay"] as! String), textRegular: info, lbl: informationLbl)
        setMessageText(textBold: (userInfo["meetingTime"] as! String), textRegular: info, lbl: informationLbl)
//        if userInfo["accepted"] as! String == "true" {
//            informationLbl.text =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has booked you for the reception on "
//            statusView.backgroundColor = #colorLiteral(red: 0, green: 0.9281212687, blue: 0.5735446811, alpha: 1)
//            statusLbl.text = "You have been accepted!"
//        } else {
//            informationLbl.text =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has not booked you for the reception on "
//            statusView.backgroundColor = #colorLiteral(red: 0.6353749633, green: 0, blue: 0.2125297487, alpha: 1)
//            statusLbl.text = "You were not accepted!"
//        }

        func setMessageText(textBold: String, textRegular: String, lbl: UILabel) {
            let boldAttribute = [
                NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
             ]
             let regularAttribute = [
                NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 18.0)!
             ]
             let boldText = NSAttributedString(string: textBold, attributes: boldAttribute)
             let regularText = NSAttributedString(string: textRegular, attributes: regularAttribute)
             let newString = NSMutableAttributedString()
             newString.append(boldText)
             newString.append(regularText)
             lbl.attributedText = newString
        }
        
        
        func getImage(imageM: UIImageView, key: String){
            // 3
            guard
                let attachment = content.attachments.first,
                attachment.url.startAccessingSecurityScopedResource()
            else {
                return
            }
            
            //        let fileURLString = attachment.url
            let fileURLString = URL(string: key)!
            
            guard
                let imageData = try? Data(contentsOf: fileURLString),
                let image = UIImage(data: imageData)
                    
            else {
                attachment.url.stopAccessingSecurityScopedResource()
                return
            }
            
            5
            imageM.image = image
            attachment.url.stopAccessingSecurityScopedResource()
        }
        
    }
    

    
    
}

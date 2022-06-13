//
//  NotificationViewController.swift
//  DoctorNotificationExtencion
//
//  Created by Azizbek Salimov on 11.06.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class DoctorNotificationViewController: UIViewController, UNNotificationContentExtension {

    
    @IBOutlet weak var patientImageView: UIImageView!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var informationLbl: UILabel!
    @IBOutlet weak var patientNameSurnamelbl: UILabel!

    @IBOutlet weak var patientPhoneLbl: UILabel!
  
    @IBOutlet weak var acceptanceBtn: UIButton!
    @IBOutlet weak var rejectionBtn: UIButton!
    
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
        patientNameSurnamelbl.text = userInfo["ownerName"] as! String
        patientPhoneLbl.text = userInfo["phone"] as! String
        getImage(imageM: logoImage, key: (userInfo["logo"] as! String))
        getImage(imageM: patientImageView, key: (userInfo["userImg"] as! String))
        
        
//        
//        if userInfo["accepted"] as! String == "true" {
//            info =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has booked you for the reception on "
//            statusView.backgroundColor = #colorLiteral(red: 0, green: 0.9281212687, blue: 0.5735446811, alpha: 1)
//            statusLbl.text = "You have been accepted!"
//        } else {
//            info =  "Hello \(userInfo["name"] as! String), Dr. \(userInfo["ownerName"] as! String) has not booked you for the reception on "
//            statusView.backgroundColor = #colorLiteral(red: 0.6353749633, green: 0, blue: 0.2125297487, alpha: 1)
//            statusLbl.text = "You were not accepted!"
//        }
//        setMessageText(textBold: (userInfo["meetingDay"] as! String) + "  " + (userInfo["meetingTime"] as! String), textRegular: info, lbl: informationLbl)
    
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
                NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 14.0)!
             ]
             let boldText = NSAttributedString(string: textBold, attributes: boldAttribute)
           
            
             let regularText = NSAttributedString(string: textRegular, attributes: regularAttribute)
             let newString = NSMutableAttributedString()
            newString.append(regularText)
             newString.append(boldText)
             
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


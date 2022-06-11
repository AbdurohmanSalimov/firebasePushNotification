//
//  NotificationService.swift
//  notificationServiceExtension
//
//  Created by Azizbek Salimov on 07.06.2022.
//
import UIKit
import UserNotifications
import FirebaseMessaging


class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = request.content
          .mutableCopy() as? UNMutableNotificationContent
        guard let bestAttemptContent = bestAttemptContent else { return }
        FIRMessagingExtensionHelper().populateNotificationContent(
          bestAttemptContent,
          withContentHandler: contentHandler)
       // let a = bestAttemptContent.ic
    
        bestAttemptContent.title = "\(bestAttemptContent.title)"
        bestAttemptContent.subtitle = " subtitle-\(bestAttemptContent.subtitle)"
       bestAttemptContent.body = "body -  \(bestAttemptContent.body) "
        if bestAttemptContent.title == "client" {
            bestAttemptContent.categoryIdentifier = "client"
        }
     
       // let imageURLString = bestAttemptContent.userInfo["q1"] as? String
       
         

//        getMediaAttachment(for: imageURLString! ) { [weak self] image in
//          // 3
//          guard
//            let self = self,
//            let image = image,
//            let fileURL = self.saveImageAttachment(
//              image: image,
//              forIdentifier: "attachment.jpg")
//            else {
//              contentHandler(bestAttemptContent)
//              return
//          }
          
          // 4
//          let imageAttachment = try? UNNotificationAttachment(
//            identifier: "image",
//            url: fileURL,
//            options: nil)
//
//          // 5
//          if let imageAttachment = imageAttachment {
//            bestAttemptContent.attachments = [imageAttachment]
//          }
//
//
//
//
//          // 6
//          contentHandler(bestAttemptContent)
//        }
//
//    }
//
//    override func serviceExtensionTimeWillExpire() {
//        // Called just before the extension will be terminated by the system.
//        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
//        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
//            contentHandler(bestAttemptContent)
//        }
//    }
//    private func saveImageAttachment(
//      image: UIImage,
//      forIdentifier identifier: String
//    ) -> URL? {
//      // 1
//      let tempDirectory = URL(fileURLWithPath: NSTemporaryDirectory())
//      // 2
//      let directoryPath = tempDirectory.appendingPathComponent(
//        ProcessInfo.processInfo.globallyUniqueString,
//        isDirectory: true)
//
//      do {
//        // 3
//        try FileManager.default.createDirectory(
//          at: directoryPath,
//          withIntermediateDirectories: true,
//          attributes: nil)
//
//        // 4
//        let fileURL = directoryPath.appendingPathComponent(identifier)
//
//        // 5
//        guard let imageData = image.pngData() else {
//          return nil
//        }
//
//        // 6
//        try imageData.write(to: fileURL)
//        return fileURL
//      } catch {
//        return nil
//      }
//    }
//
//    private func getMediaAttachment(
//      for urlString: String,
//      completion: @escaping (UIImage?) -> Void
//    ) {
//      // 1
//      guard let url = URL(string: urlString) else {
//        completion(nil)
//        return
//      }
//
//      // 2
//      ImageDownloader.shared.downloadImage(forURL: url) { result in
//        // 3
//        guard let image = try? result.get() else {
//          completion(nil)
//          return
//        }
//
//        // 4
//        completion(image)
//      }
//    }
//


    }
}

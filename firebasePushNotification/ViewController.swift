//
//  ViewController.swift
//  firebasePushNotification
//
//  Created by Azizbek Salimov on 07.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
//    let boldText = "Filter:"
//    let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
//    let attributedString = NSMutableAttributedString(string: self().boldText, attributes: self.attrs)
//
//    let normalText = "Hi am normal"
//    let normalString = NSMutableAttributedString(string: self.normalText)
//
//    attributedString.append(normalString)
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        postAction()
    }
    
    
    func postAction() {
        let Url = String(format: "http://192.168.0.97:4000/test")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["test" : "Test111"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    
    
    
    


}

extension String {
func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
    let _font = font ?? UIFont.systemFont(ofSize: 14, weight: .bold)
  let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
  let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
  let range = (self as NSString).range(of: text)
  fullString.addAttributes(boldFontAttribute, range: range)
  return fullString
}}

import CoreData
import UIKit

// MARK: - ...  Struct Common  functions
public struct Common {
}
// MARK: - ...  functions
extension Common {
    public func call(text: String?) {
        if var mobile = text {
            mobile = mobile.cut(charSplit: " ", charWith: "")
            guard let number = URL(string: "tel://" + mobile) else { return }
            UIApplication.shared.open(number)
        } else {
            return
        }
    }
    public func sms(text: String?) {
        if let mobile = text {
            guard let number = URL(string: "sms://" + mobile) else { return }
            UIApplication.shared.open(number)
        } else {
            return
        }
    }
    
    public func openWhatsapp(phone: String?){
        guard let phone = phone, phone != "" else {
            return
        }
        let urlWhats = "whatsapp://send?phone=(+\(phone)"
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed){
            if let whatsappURL = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL){
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(whatsappURL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(whatsappURL)
                    }
                } else {
                  //  NotificationBuilder().setBody(Messages.noWhatsapp).setTheme(.warning).bulid()
                }
            }
        }
    }
    
    public func firebaseToken() -> String? {
        return nil
    }
    
    public func sendSms(text: String?) {
        sms(text: text)
    }
    public func phoneCall(text: String?) {
        call(text: text)
    }
    public func sendMail(text: String?) {
        if let email = text {
            let string = "mailto:"+email
            if let url = URL(string: string) {
                UIApplication.shared.open(url)
            }
        } else {
            return
        }
    }
    public func openUrl(text: String?) {
        if let url = text {
            let url = URL(string: url)!
            UIApplication.shared.open(url)
        } else {
            return
        }
    }
    public func shareApp(items: [Any] = []) {
        var sharing = items
        sharing.append(Constants.itunesURL)
        let activityVC = UIActivityViewController(activityItems: sharing, applicationActivities: nil)
        //New Excluded Activities Code
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        //
        let view = UIApplication.topMostController()
        activityVC.popoverPresentationController?.sourceView = view.view
        view.present(activityVC, animated: true, completion: nil)
    }
}

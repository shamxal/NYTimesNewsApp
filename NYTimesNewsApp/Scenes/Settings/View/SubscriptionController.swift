//
//  SubscriptionController.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 06.10.22.
//

import UIKit

class SubscriptionController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var descriptionText = "Subscription Pricing and Terms\nFor unlocking all features and content, you have to be premium member. It offers 3 auto renewable subscription options. $2.99 for 1 week, $7.99 for 1 month. Weekly subscription doen't have any trial period. It costs immediately $2.99, $7.99 subscription will start after 3-days free tria.\nEnd of trial and subscription renewal:\nThis price is for United States customers. Pricing in other countries may vary and actual charges may be converted to your local currency depending on the country of residence.\nPayment will be charged to iTunes Account at confirmation of purchase. \nSubscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. \nAccount will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of the renewal.\nSubscriptions may be managed by the user and auto-renewal may be turned off by going to the user’s Account Settings after purchase.\nAny unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable.\nCanceling trial or subscription\nYou can turn off the auto-renew for the subscription whenever you want to through iTunes. Check https://support.apple.com/en-en/HT202039.\nTerms of Use: -termsURL-\nPrivacy Policy: -privacyURL-\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = descriptionText
    }
    
    @IBAction func weeklyButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func monthlyButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

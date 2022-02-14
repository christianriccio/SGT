
//

import Foundation
import FirebaseAuth
import UIKit

@objc(MainViewController)
// [START signin_controller]
class MainViewController: UITableViewController {
    /** @var handle
     @brief The handler for the auth state listener, to allow cancelling later.
     */
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [START auth_listener]
        handle = Auth.auth().addStateDidChangeListener { auth, user in

            // [START_EXCLUDE]
            if(user != nil){
                print("trigged")
                UserInfo().user = FBFirestore.retrieveFBUser(uid: user!.uid)
            }
            self.tableView.reloadData()
            // [END_EXCLUDE]
        }
    }
}

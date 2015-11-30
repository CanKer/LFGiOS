//
//  Amigos.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit
import Parse

class Amigos: UITableViewController {
    var friends = [PFUser]()
    var currentUser: PFUser!
    var friendsRelation: PFRelation!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view will appear. fetch new friends...")
        fetchFriends()
    }
    
    func fetchFriends()
    {
        currentUser = PFUser.currentUser()!
        if let friendsRelation = currentUser["friendsRelation"] as? PFRelation {
            let friendsQuery = friendsRelation.query()
            friendsQuery.orderByAscending("username")
            friendsQuery.findObjectsInBackgroundWithBlock({ (friends, error) -> Void in
                if error == nil {
                    self.friends = friends as! [PFUser]
                    self.tableView.reloadData()
                } else {
                    print(error)
                }
            })
        }
    }
    
    // MARK: - UITableViewDataSource
    
    struct Storyboard {
        static let CellIdentifier = "Friend Cell"
        static let ShowEditFriendsSegue = "Show Edit Friends"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath)
        let friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.username
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

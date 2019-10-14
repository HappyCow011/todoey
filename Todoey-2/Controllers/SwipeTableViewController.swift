//
//  SwipeTableViewController.swift
//  Todoey-2
//
//  Created by Aleksey Shapoval on 10/14/19.
//  Copyright © 2019 VoVa LLC. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

//MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
            
            cell.delegate = self
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    
         guard orientation == .right else { return nil }

         let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
             
            print("Delete cell")
//             if let categoryForDeletion = self.categories?[indexPath.row] {
//                 do {
//                     try self.realm.write {
//                         self.realm.delete(categoryForDeletion)
//                     }
//                 } catch {
//                     print("Error deleting category, \(error)")
//                 }
//
//             }
             
         }

         // customize the action appearance
         deleteAction.image = UIImage(named: "delete-icon")

         return [deleteAction]
     }

     func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
         var options = SwipeOptions()
         options.expansionStyle = .destructive
         return options
     }

}



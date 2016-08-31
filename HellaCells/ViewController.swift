//
//  ViewController.swift
//  HellaCells
//
//  Created by Flatiron School on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var hellaCellTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.hellaCellTableView.accessibilityIdentifier = "Table"
        self.hellaCellTableView.delegate = self
        self.hellaCellTableView.dataSource = self
        self.hellaCellTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.hellaCellTableView
        .dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row + 1).")
        self.performSegueWithIdentifier("detailSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            let detailVC = segue.destinationViewController as! DetailViewController
            let selectedIndexPath = self.hellaCellTableView.indexPathForSelectedRow!
            detailVC.numberLabel = String(selectedIndexPath.row + 1)
        
    }
    
//    func biggestDifference (array : [Int]) {
//        var biggest = 0
//        
//        for (_, index) in array.enumerate() {
//            
//            if index == array.last {
//                
//                let current = array[index] - array[index+1]
//                
//                if abs(current) > biggest{
//                    
//                    biggest = current
//                    
//                }
//            }
//        }
//    }
}


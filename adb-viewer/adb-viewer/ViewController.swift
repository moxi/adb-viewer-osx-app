//
//  ViewController.swift
//  adb-viewer
//
//  Created by Roberto Carlos Gonzalez Flores on 3/5/16.
//  Copyright © 2016 rcgonzalezf. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let task: NSTask = NSTask()
		let pipe: NSPipe = NSPipe()

		task.launchPath = "/usr/local/bin/adb"
		task.arguments = ["devices"]
		task.standardOutput = pipe
		task.launch()

		let handle = pipe.fileHandleForReading
		let data = handle.readDataToEndOfFile()
        let result_s = NSString(data: data, encoding: NSUTF8StringEncoding)
        result_s?.capitalizedString
        // Do any additional setup after loading the view.
	}

	override var representedObject: AnyObject? {
		didSet {
			// Update the view, if already loaded.
		}
	}
}


//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Rozalia Rodichev on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    // MARK: - Properties
    var entry: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let entryTitle = titleTextField.text, !entryTitle.isEmpty,
              let entryText = bodyTextView.text, !entryText.isEmpty else { return }
        
        if let entry = entry {
            EntryController.sharedController.updateEntry(entry: entry, title: entryTitle, bodytext: entryText)
        } else {
            EntryController.sharedController.createEntry(title: entryTitle, body: entryText)
        }
        
        navigationController?.popViewController(animated: true)
              
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

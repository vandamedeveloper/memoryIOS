//
//  ViewController.swift
//  Memory
//
//  Created by Vandi Hrustic on 14/5/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var namesStack: UIStackView!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var firstName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        namesStack.isHidden = true
        startButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playerNamesViewController = segue.destination as? PlayerNamesViewController {
            playerNamesViewController.delegate = self
                if segue.identifier == "segueToPlayerNames1" {
                    playerNamesViewController.isMachineEnabled = true
                } else if segue.identifier == "segueToPlayerNames2" {
                    playerNamesViewController.isMachineEnabled = false
                }
            }
    }
    
    
    @IBAction func onStart(_ sender: Any) {
        
    }
}

extension ViewController: PlayerNamesProtocol{
    func didSelectPlayerName(names: [String]) {
        firstName.text = names.first
        if names.count == 1{
            secondName.text = "Machine"
        }else{
            secondName.text = names.last
        }
        namesStack.isHidden = false
        startButton.isEnabled = true
    }
}


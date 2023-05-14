//
//  PlayerNamesViewController.swift
//  Memory
//
//  Created by Vandi Hrustic on 14/5/23.
//

import UIKit

protocol PlayerNamesProtocol:AnyObject{
    func didSelectPlayerName(names: [String])
    
}

class PlayerNamesViewController: UIViewController {
    
    
    @IBOutlet weak var playerTwoInput: UITextField!
    @IBOutlet weak var playerOneInput: UITextField!
    weak var delegate: PlayerNamesProtocol?
    var isMachineEnabled: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if isMachineEnabled{
            playerTwoInput.text = "Machine"
            playerTwoInput.isEnabled = false
        }
        
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
        var playerNames = [String]()
        
        if let player1Name = playerOneInput.text,!player1Name.isEmpty{
            playerNames.append(player1Name)
        }
        if let player2Name = playerTwoInput.text,!player2Name.isEmpty{
            playerNames.append(player2Name)
        }
        delegate?.didSelectPlayerName(names: playerNames)
        dismiss(animated: true,completion: nil)
    }

}

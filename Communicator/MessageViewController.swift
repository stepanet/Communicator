import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var connectionsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendText: UIButton!
    @IBOutlet weak var lblTExt: UILabel!

    let messageService = Communicator()

    override func viewDidLoad() {
        super.viewDidLoad()
        messageService.delegate = self
    }

    func changeLbl(text : String) {
        lblTExt.text = text
    }
    
    @IBAction func sendTxtAction(_ sender: UIButton) {
        messageService.sendText(text: textField.text!)
    }
}

extension MessageViewController : CommunicatorDelegate {

    func connectedDevicesChanged(manager: Communicator, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }
    
    func textChanged(manager: Communicator, text: String) {
        OperationQueue.main.addOperation {
            self.lblTExt.text = text
        }
    }

}

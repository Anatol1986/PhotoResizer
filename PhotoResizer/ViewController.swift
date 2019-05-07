
//  Copyright © 2019 Anatol Uarmolovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageForRotate: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let zoomGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handleScaleChange(sender:)))
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotation(sender:)))
       self.imageForRotate.addGestureRecognizer(rotationGesture)
        self.imageForRotate.addGestureRecognizer(zoomGesture)
    }
    @objc func handleRotation(sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else {return}
        
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    @objc func handleScaleChange(sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else {
            return
        }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }

}


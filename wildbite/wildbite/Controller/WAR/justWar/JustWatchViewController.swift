//
//  JustWatchViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 19.06.2023.
//

import UIKit
import ARKit
import SceneKit
import Kingfisher
class JustWatchViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
         super.viewDidLoad()
         
         // ARSCNView'i yapılandırın
         sceneView.delegate = self
         sceneView.showsStatistics = true
         
         // AR düğümünü oluşturun
         let scene = SCNScene()
         sceneView.scene = scene
         
         // GIF dosyasının adını ve uzantısını belirtin
         let gifName = "05"
         let gifExtension = "gif"
         
         // Bundle'dan GIF dosyasını alın
         guard let gifURL = Bundle.main.url(forResource: gifName, withExtension: gifExtension) else {
             fatalError("GIF dosyası bulunamadı.")
         }
         
         // Kingfisher ile resmi indirin ve gösterin
         imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0.3, height: 0.3))
         let resource = ImageResource(downloadURL: gifURL)
         imageView.kf.setImage(with: resource, options: [.cacheOriginalImage, .onlyLoadFirstFrame])
         
         // SCNPlane oluşturun ve imageView'i malzemesine atayın
         let plane = SCNPlane(width: 0.3, height: 0.3)
         plane.firstMaterial?.diffuse.contents = imageView.image
         
         // SCNNode oluşturun ve plane'i node'un geometrisi olarak ayarlayın
         let node = SCNNode(geometry: plane)
         
         // Node'u sahne kök düğümüne ekleyin
         scene.rootNode.addChildNode(node)
         
         // ARKit konumlandırmasını yapılandırın
         let configuration = ARWorldTrackingConfiguration()
         sceneView.session.run(configuration)
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         
         // ARKit konumlandırmayı başlatın
         let configuration = ARWorldTrackingConfiguration()
         sceneView.session.run(configuration)
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         
         // ARKit konumlandırmayı duraklatın
         sceneView.session.pause()
     }
 }

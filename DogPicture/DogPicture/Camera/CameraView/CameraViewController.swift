//
//  CameraViewController.swift
//  DogPicture
//
//  Created by 김동우 on 2021/06/25.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    var presenter: CameraPresenterProtocol?
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    
    let captureButton = UIButton()
    let cameraPreview = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.view.backgroundColor = .white
        
        updateCameraView()
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateCameraView() {
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],
                                                                      mediaType: AVMediaType.video,
                                                                      position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        print(devices)
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        currentCamera = backCamera
    }
    
    func setupInputOutput() {
        do {
            guard let currentCamera = currentCamera else { return }
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera)
            captureSession.addInput(captureDeviceInput)
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])],
                                                      completionHandler: nil)
        } catch {
            print(error)
        }
    }
    
    func setupPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.maxX, height: self.view.frame.maxY)
        guard let cameraPreviewLayer = cameraPreviewLayer else { return }
        self.view.layer.insertSublayer(cameraPreviewLayer, at: 0)
        
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ captureButton ].forEach() { view.addSubview($0) }
        
        captureButton.do {
            view.bringSubviewToFront(captureButton)
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.white.cgColor
            $0.addTarget(self, action: #selector(captureButtonDidTap(sender:)), for: .touchUpInside)
        }
    }
    
    func layout() {
        captureButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
    
    @objc func captureButtonDidTap(sender: UIButton) {
        presenter?.showPreview()
    }
}

extension CameraViewController: CameraViewProtocol {
    
}

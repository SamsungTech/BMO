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
    
    var photoImage: UIImage?
    
    var data = Data()
    
    var photoView = UIImageView()
    
    
    
    let captureButton = UIButton()
    let cameraPreview = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.view.backgroundColor = .white
        view.bringSubviewToFront(captureButton)
        view.bringSubviewToFront(photoView)
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
            if let currentCamera = currentCamera {
                let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera)
                captureSession.addInput(captureDeviceInput)
            }
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])],
                                                      completionHandler: nil)
            if let photoOutput = photoOutput {
                captureSession.addOutput(photoOutput)
            }
        } catch {
            print(error)
        }
    }
    
    func setupPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.maxX, height: self.view.frame.maxY)
        
        if let cameraPreviewLayer = cameraPreviewLayer {
            self.view.layer.insertSublayer(cameraPreviewLayer, at: 0)
        }
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    func updateView() {
        attribute()
        layout()
    }
    
    func attribute() {
        [ captureButton, photoView ].forEach() { view.addSubview($0) }
        
        captureButton.do {
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.white.cgColor
            $0.addTarget(self, action: #selector(captureButtonDidTap(sender:)), for: .touchUpInside)
        }
        photoView.do {
            $0.frame = CGRect(x: 0, y: 30, width: 100, height: 100)
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
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            data = imageData
            photoImage = UIImage(data: imageData)
            photoView.image = photoImage
            // 여기서 PreviewViewController 에 있는 captureImageView까지 데이터를 이동시켜야 된다.
            presenter?.showPreview(imageData: data)
        }
    }
}

extension CameraViewController: CameraViewProtocol {
    
}

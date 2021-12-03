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
    
    let navigaitionBar = UIView()
    let dismissCameraButton = UIButton()
    let dismissButtonImageView = UIImageView()
    var transitionButton = UIButton()
    var transitionImageView = UIImageView()
    let nextButton = UIButton()
    let nextLabel = UILabel()
    let bottomBar = UIView()
    let soundButton = UIButton()
    let soundButtonImageView = UIImageView()
    let libraryButton = UIButton()
    let libraryButtonImageView = UIImageView()
    
    let captureButton = UIButton()
    let captureButtonImageView = UIImageView()
    let cameraPreview = UIImageView()
    
    var filterNameButton = UIButton()
    var filterNameButtonLabel = UILabel()
    let photoButton = UIButton()
    let photoButtonLabel = UILabel()
    let videoButton = UIButton()
    let videoButtonLabel = UILabel()
    
    var photoDataArray: [Data] = []
    
    var soundEffectView = UIView()
    var soundScrollView = UIScrollView()
    var soundStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        self.view.backgroundColor = .white
        view.bringSubviewToFront(captureButton)
        updateCameraView()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
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
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video,
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
        cameraPreviewLayer?.do {
            $0.videoGravity = AVLayerVideoGravity.resizeAspectFill
            $0.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            $0.frame = CGRect(x: 0,
                              y: 0,
                              width: self.view.frame.maxX,
                              height: self.view.frame.maxY)
        }
        
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
        [ navigaitionBar, bottomBar ].forEach() { view.addSubview($0) }
        [ dismissCameraButton, transitionButton, nextButton ].forEach() { navigaitionBar.addSubview($0) }
        dismissCameraButton.addSubview(dismissButtonImageView)
        transitionButton.addSubview(transitionImageView)
        nextButton.addSubview(nextLabel)
        [ filterNameButton, photoButton, videoButton,
          libraryButton, captureButton, soundButton ].forEach() { bottomBar.addSubview($0) }
        filterNameButton.addSubview(filterNameButtonLabel)
        photoButton.addSubview(photoButtonLabel)
        videoButton.addSubview(videoButtonLabel)
        libraryButton.addSubview(libraryButtonImageView)
        captureButton.addSubview(captureButtonImageView)
        soundButton.addSubview(soundButtonImageView)
        
        navigaitionBar.do {
            $0.backgroundColor = .white
        }
        dismissCameraButton.do {
            $0.addTarget(self, action: #selector(dismissButtonDidTap(sender:)), for: .touchUpInside)
        }
        dismissButtonImageView.do {
            $0.tintColor = .darkGray
            $0.image = UIImage(systemName: "xmark")
        }
        transitionButton.do {
            $0.addTarget(self, action: #selector(ratioButtonDidTap(sender:)), for: .touchUpInside)
        }
        transitionImageView.do {
            $0.tintColor = .black
            $0.image = UIImage(systemName: "arrow.triangle.2.circlepath")
        }
        nextButton.do {
            $0.addTarget(self, action: #selector(nextButtonDidTap(sender:)), for: .touchUpInside)
        }
        nextLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 15)
            $0.textColor = .darkGray
            $0.text = "다음"
        }
        
        bottomBar.do {
            $0.backgroundColor = .white
        }
        filterNameButton.do {
            $0.backgroundColor = .clear
            $0.viewRadius(cornerRadius: 15, maskToBounds: true)
            $0.addTarget(self, action: #selector(filterButtonDidTap(sender:)), for: .touchUpInside)
        }
        filterNameButtonLabel.do {
            $0.textColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "FILTER"
        }
        photoButton.do {
            $0.backgroundColor = .systemPink
            $0.viewRadius(cornerRadius: 15, maskToBounds: true)
            $0.addTarget(self, action: #selector(photoORvideoButtonDidTap(sender:)), for: .touchUpInside)
        }
        photoButtonLabel.do {
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "PHOTO"
        }
        videoButton.do {
            $0.backgroundColor = .clear
            $0.viewRadius(cornerRadius: 15, maskToBounds: true)
            $0.addTarget(self, action: #selector(photoORvideoButtonDidTap(sender:)), for: .touchUpInside)
        }
        videoButtonLabel.do {
            $0.textColor = .lightGray
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.text = "VIDEO"
        }
        libraryButton.do {
            $0.addTarget(self, action: #selector(libraryButtonDidTap(sender:)), for: .touchUpInside)
        }
        libraryButtonImageView.do {
            $0.tintColor = .black
            $0.image = UIImage(systemName: "globe.americas")
        }
        captureButton.do {
            $0.layer.cornerRadius = 50
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.black.cgColor
            $0.addTarget(self, action: #selector(captureButtonDidTap(sender:)), for: .touchUpInside)
        }
        captureButtonImageView.do {
            $0.tintColor = .black
            $0.image = UIImage(systemName: "pawprint.fill")
        }
        soundButton.do {
            $0.addTarget(self, action: #selector(soundButtonDidTap(sender:)), for: .touchUpInside)
        }
        soundButtonImageView.do {
            $0.tintColor = .black
            $0.image = UIImage(systemName: "bell.circle")
        }
    }
    
    func layout() {
        navigaitionBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        dismissCameraButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: navigaitionBar.leadingAnchor, constant: 5).isActive = true
            $0.bottomAnchor.constraint(equalTo: navigaitionBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        dismissButtonImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: dismissCameraButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: dismissCameraButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 18).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        transitionButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: navigaitionBar.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: dismissCameraButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        transitionImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: transitionButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: transitionButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 25).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 23).isActive = true
        }
        nextButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.trailingAnchor.constraint(equalTo: navigaitionBar.trailingAnchor, constant: -5).isActive = true
            $0.bottomAnchor.constraint(equalTo: navigaitionBar.bottomAnchor, constant: -5).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 40).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        nextLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: nextButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: nextButton.centerYAnchor).isActive = true
        }
        
        bottomBar.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        }
        photoButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 10).isActive = true
            $0.centerXAnchor.constraint(equalTo: bottomBar.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        photoButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: photoButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: photoButton.centerYAnchor).isActive = true
        }
        filterNameButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 10).isActive = true
            $0.trailingAnchor.constraint(equalTo: photoButton.leadingAnchor, constant: -10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        filterNameButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: filterNameButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: filterNameButton.centerYAnchor).isActive = true
        }
        videoButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 10).isActive = true
            $0.leadingAnchor.constraint(equalTo: photoButton.trailingAnchor, constant: 10).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        videoButtonLabel.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: videoButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: videoButton.centerYAnchor).isActive = true
        }
        captureButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        captureButtonImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: captureButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 47).isActive = true
        }
        libraryButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: bottomBar.leadingAnchor, constant: 50).isActive = true
            $0.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        libraryButtonImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: libraryButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: libraryButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        soundButton.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.trailingAnchor.constraint(equalTo: bottomBar.trailingAnchor, constant: -50).isActive = true
            $0.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 50).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        soundButtonImageView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: soundButton.centerXAnchor).isActive = true
            $0.centerYAnchor.constraint(equalTo: soundButton.centerYAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
}

extension CameraViewController {
    @objc func dismissButtonDidTap(sender: UIButton) {
        presenter?.dismissButtonCilked()
    }
    @objc func ratioButtonDidTap(sender: UIButton) {
        
    }
    @objc func nextButtonDidTap(sender: UIButton) {
        print("넥스트버튼 클릭")
        if photoDataArray.count != 0 {
            presenter?.nextButtonCilcked(imageData: photoDataArray)
        }
        print("찍어놓은 사진이 없습돠")
    }
    @objc func filterButtonDidTap(sender: UIButton) {
        
    }
    @objc func photoORvideoButtonDidTap(sender: UIButton) {
        if sender == photoButton {
            photoButton.backgroundColor = .systemPink
            photoButtonLabel.textColor = .white
            videoButton.backgroundColor = .clear
            videoButtonLabel.textColor = .lightGray
        } else if sender == videoButton {
            videoButton.backgroundColor = .systemPink
            videoButtonLabel.textColor = .white
            photoButton.backgroundColor = .clear
            photoButtonLabel.textColor = .lightGray
        }
    }
    @objc func libraryButtonDidTap(sender: UIButton) {
        
    }
    @objc func captureButtonDidTap(sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    @objc func soundButtonDidTap(sender: UIButton) {
        
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            data = imageData
            photoDataArray.append(data)
        }
    }
}

extension CameraViewController: CameraViewProtocol {
    
}

extension CameraViewController {
    
}


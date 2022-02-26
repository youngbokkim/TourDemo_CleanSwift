//
//  FestivalDetailViewController.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/08.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FestivalDetailDisplayLogic
{
    func displayFestival(viewModel: FestivalDetail.FetchItem.ViewModel.DisplayedFestivalItem)
}

class FestivalDetailViewController: UIViewController, FestivalDetailDisplayLogic
{
  var interactor: FestivalDetailBusinessLogic?
  var router: (NSObjectProtocol & FestivalDetailRoutingLogic & FestivalDetailDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = FestivalDetailInteractor()
    let presenter = FestivalDetailPresenter()
    let router = FestivalDetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    drawFestival()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var infoTextView: UITextView!
    
  func drawFestival()
  {
      interactor?.getFestivalInfo()
  }
  
    func displayFestival(viewModel: FestivalDetail.FetchItem.ViewModel.DisplayedFestivalItem)
  {
      DispatchQueue.global().async {
          if let url = URL(string: viewModel.firstImage) {
              do{
                  let imgData = try Data(contentsOf: url)
                  DispatchQueue.main.async {
                      self.thumbnailImageView.image = UIImage(data: imgData)
                  }
              } catch {}
          }
      }
      
      var info = viewModel.title
      info.append(contentsOf: "\n\n 주소: \(viewModel.addr)")
      info.append(contentsOf: "\n 전화: \(viewModel.tel)")
      self.infoTextView.text = info
  }
}

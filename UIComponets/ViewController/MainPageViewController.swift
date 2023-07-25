//
//  MainPageViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//

import UIKit

class MainPageViewController: UIPageViewController {

    // MARK: - Variables And Declairations
    lazy var orderedViewController: [UIViewController] = [viewControllerWith(name: Constants.ViewController.blueViewController),viewControllerWith(name: Constants.ViewController.redViewController)]
    private var isLoading = false
    private var currentIndex = 0
    private let pageControl = UIPageControl()
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setFirstViewController()
        self.delegate = self
        self.dataSource = self
        setUiPageControl()
        view.addSubview(pageControl)
       
    }
    
    // MARK: - Set up
    private func setFirstViewController() {
        let firstViewController = orderedViewController[currentIndex]
        setViewControllers([firstViewController], direction: .forward, animated: false)
    }
    
    // MARK: - Set up
    private func setUiPageControl() {
        pageControl.numberOfPages = 2
        pageControl.frame = CGRect(x: view.frame.width/2 - 50, y: view.frame.height - 100 , width: 100, height: 50)
        view.addSubview(pageControl)
        pageControl.addTarget(self, action: #selector(pageControlTap), for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc func pageControlTap(_ sender: UIPageControl) {
        print(#function)
    }
   
    
   
    // MARK: - FUNCTION
    private func viewControllerWith(name: String) -> UIViewController {
        return UIStoryboard(name: Constants.Storybords.main, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
}

// MARK: - Extensions
extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let pageViewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = pageViewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard previousIndex < orderedViewController.count else {
            return nil
        }
        return orderedViewController[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pageViewControllerIndex = orderedViewController.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = pageViewControllerIndex + 1
        guard nextIndex < orderedViewController.count else {
            return nil
        }
        guard nextIndex > 0 else {
            return nil
        }
        return orderedViewController[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let fistController = viewControllers?.first, let index = orderedViewController.firstIndex(of: fistController) {
            pageControl.currentPage = index
            print(index)
        }
    }
    
}

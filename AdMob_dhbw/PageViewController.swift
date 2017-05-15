//
//  PageViewController.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 08.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    
    // MARK: Init
    
    // array to reference view controllers
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(ofType: "Animation"),
                self.newViewController(ofType: "Banner"),
                self.newViewController(ofType: "StickyBanner"),
                self.newViewController(ofType: "Interstitial")]
    }()
    
    // get view controller from storyboard
    func newViewController(ofType type: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(type)AD")
    }
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = UIColor.white
        
        dataSource = self
        delegate = self
        // load first view controller
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
                
    }
    
    // MARK: Layout PageViewController
    
    // make the background of dots from page view controller transparent
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
                let pageView = view as! UIPageControl
                pageView.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
                pageView.currentPageIndicatorTintColor = UIColor.black
            }
        }
    }
    
    // MARK: PageViewController actions
    
    // load previous view
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }    
        
        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    // load next view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    // count of dots for page view controller
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    // highlight dot with index of the current view controller
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}

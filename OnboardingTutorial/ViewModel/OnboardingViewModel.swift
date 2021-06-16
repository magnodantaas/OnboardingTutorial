//
//  OnboardingViewmodel.swift
//  OnboardingTutorial
//
//  Created by Magno Miranda Dantas on 16/06/21.
//

import Foundation
import paper_onboarding

struct OnboardingViewModel {
    
    private let itemCount: Int
    
    init(itemCount: Int) {
        self.itemCount = itemCount
    }
    
    func shouldShowGetStartedButton(forIndex index: Int) -> Bool {
        return index == itemCount - 1 ? true : false
    }
}

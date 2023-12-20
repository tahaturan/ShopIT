//
//  AppTextConstants.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import Foundation

struct AppTextConstants {
    struct OnboardViewController {
        static let firstOnboardTitle = NSLocalizedString("Choose Product", comment: "")
        static let firstOnboardSubTitle = NSLocalizedString("A product is the item offered for sale. \nA product can be a service or an item. It can be physical or in virtual or cyber form", comment: "")
        static let secondOnboardTitle = NSLocalizedString("Make Payment", comment: "")
        static let secondOnboardSubTitle = NSLocalizedString("Payment is the transfer of money services in exchange produtc or Payments typically made terms agreed", comment: "")
        static let thirdOnboardTitle = NSLocalizedString("Get Your Order", comment: "")
        static let thirdOnboardSubTitle = NSLocalizedString("Business or commerce an order is a stated intention either spoken to engage in a cemmercial transaction specific products", comment: "")
        static let skipText = NSLocalizedString("Skip", comment: "")
        static let getStartedText = NSLocalizedString("Get Started", comment: "")
    }
    
    struct LoginViewController {
        
        static let forgotPassword = NSLocalizedString("Forgot password?", comment: "")
        static let loginText = NSLocalizedString("Log in", comment: "")
        static let signUpText = NSLocalizedString("Sign Up", comment: "")
        static let haveAccountText = NSLocalizedString("Don't have an account? ", comment: "")
        static let alreadyHaveAccountText = NSLocalizedString("Already have an account? ", comment: "")
        static let termsContionsText = NSLocalizedString("Terms & Conditions", comment: "")
        static let acceptAllText = NSLocalizedString("I accept all the ", comment: "")
        
    }
    struct CustomTextField {
        static let email = NSLocalizedString("E-mail", comment: "")
        static let name = NSLocalizedString("Name", comment: "")
        static let password = NSLocalizedString("Password", comment: "")
    }
    struct HomeViewController {
        static let navBarTitle = NSLocalizedString("Aydin/Soke", comment: "")
        static let search = NSLocalizedString("Search", comment: "")
        static let title = NSLocalizedString("Explore", comment: "")
        static let subTitle = NSLocalizedString("best Outfits for you", comment: "")
    }
    struct CellIDs {
        static let homeCollectionViewID: String = "HomeCollectionID"
        static let searchViewTableID: String = "SearchTableViewCell"
    }
}

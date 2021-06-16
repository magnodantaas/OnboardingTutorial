//
//  Constants.swift
//  OnboardingTutorial
//
//  Created by Magno Miranda Dantas on 16/06/21.
//

import Foundation
import Firebase

let MSG_METRICS = "Metrics"
let MSG_DASHBOARD = "Dashboard"
let MSG_NOTIFICATIONS = "Get Notified"
let MSG_ONBOARDING_METRICS = "Extract valuable insights and come up with data driven product"
let MSG_ONBOARDING_NOTIFICATIONS = "Get notified when important stuff is happening, so you don't miss out on the action"
let MSG_ONBOARDING_DASHBOARD = "Everything you need all in one place, available through our dashboard feature"
let MSG_LOGOUT = "Log Out"
let MSG_CANCEL = "Cancel"
let MSG_ALERT_LOGOUT = "Are you sure you want to log out?"
let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let MSG_RESET_PASSWORD_LINK_SENTS = "We sent a link to your email to reset your password."

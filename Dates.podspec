#
#  Be sure to run `pod spec lint Dates.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name         = "Dates"
  spec.version      = "1.0.0"
  spec.summary      = "Dates extensions and functions in Swift."

  spec.description  = <<-DESC
  "Dates is a small Swift library containing useful Date extensions and functions that will speed up your development workflow."
                   DESC

  spec.homepage     = "https://github.com/lajosdeme/Dates"

  spec.license = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "lajosdeme" => "lajosd@protonmail.ch" }

  spec.social_media_url   = "https://twitter.com/lajosdeme"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

   spec.platform     = :ios, "10.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source       = { :git => "https://github.com/lajosdeme/Dates.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source_files  = 'Dates/*.swift'

  spec.swift_version = "5.0"

end

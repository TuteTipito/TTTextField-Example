Pod::Spec.new do |s|
  s.name         = "TTTextField"
  s.version      = "1.0.2"
  s.summary      = "Custom TextField"
  s.description  = "TTTextfield TT Custom"
  s.homepage     = "https://github.com/TuteTipito/TTTextField-Example.git"
  s.license      = "MIT"
  s.author       = { "Matias Spinelli" => "matiasspinelli@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/TuteTipito/TTTextField-Example.git", :tag => "#{s.version}" }
  s.source_files  = "TTTextField", "TTTextField/**/*.{swift}"
  s.resources = "TTTextField/**/*.{xib}"
  s.framework  = "UIKit"
  s.ios.framework = "UIKit"
  s.requires_arc = true
end

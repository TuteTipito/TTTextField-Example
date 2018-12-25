Pod::Spec.new do |s|
  s.name         = "TTTextField"
  s.version      = "1.0.8"
  s.summary      = "Custom TextField"
  s.description  = "TTTextfield TT Custom"
  s.homepage     = "https://github.com/TuteTipito/TTTextField-Example.git"
  s.license      = "MIT"
  s.author       = { "Matias Spinelli" => "matiasspinelli@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/TuteTipito/TTTextField-Example.git", :tag => "#{s.version}" }
  s.source_files = "TTTextField", "TTTextField/**/*.{swift}"
  s.resources	 = "TTTextField/**/*.{xib}"
  s.requires_arc = true
  s.swift_version= "4.2"
end

Pod::Spec.new do |s|
  s.name = "ALIndicatorView"
  s.version  = "1.0.0"
  s.license = { :type => "Apache-2.0", :file => "LICENSE" }
  s.summary  = "Indicator view"
  s.homepage = "https://github.com/AlexGit03/ALIndicatorView"
  s.author   = { "Chillura Antonio Alessandro" => "chillura03@gmail.com" }
  s.source   = { :git => "https://github.com/AlexGit03/ALIndicatorView.git", :tag => "1.0.0" }
  s.ios.deployment_target = "9.0"
  s.ios.vendored_frameworks = "ALIndicatorView.framework"
end
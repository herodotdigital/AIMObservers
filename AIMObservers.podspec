Pod::Spec.new do |s|
  s.name         = "AIMObservers"
  s.version      = "0.3"
  s.summary      = "Notifications and KVO observers used by AIM team"
  s.homepage     = "https://github.com/AllinMobile/AIMObservers"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Maciej Gad" => "https://github.com/MaciejGad" }
  s.social_media_url   = "https://twitter.com/maciej_gad"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AllinMobile/AIMObservers.git", :tag => 'v0.3' }
  s.requires_arc = true
  s.dependency "AIMObserver", "~> 0.3"
  s.dependency "AIMNotificationObserver", "~> 0.3"
end
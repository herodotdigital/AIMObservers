Pod::Spec.new do |s|
  s.name         = "AIMNotificationObserver"
  s.version      = "0.1"
  s.summary      = "Notifications observer used by AIM team"
  s.homepage     = "https://github.com/AllinMobile/AIMObservers"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Maciej Gad" => "https://github.com/MaciejGad" }
  s.social_media_url   = "https://twitter.com/maciej_gad"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/AllinMobile/AIMObservers.git", :tag => '0.1' }
  s.source_files  =  "AIMNotificationObserver.{h,m}"
  s.requires_arc = true
end
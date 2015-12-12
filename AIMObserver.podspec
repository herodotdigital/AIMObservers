Pod::Spec.new do |s|
  s.name         = "AIMObserver"
  s.version      = "0.2"
  s.summary      = "Key value observer used by AIM team"
  s.homepage     = "https://github.com/AllinMobile/AIMObservers"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Maciej Gad" => "https://github.com/MaciejGad" }
  s.social_media_url   = "https://twitter.com/maciej_gad"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/AllinMobile/AIMObservers.git", :tag => 'v0.2' }
  s.source_files  =  "AIMObserver.{h,m}"
  s.requires_arc = true
end
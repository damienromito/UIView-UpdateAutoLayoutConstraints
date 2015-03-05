
Pod::Spec.new do |s|
  s.name             = "UpdateAutoLayoutConstraints"
  s.version          = "0.2.0"
  s.summary          = "An easy way to create and update AutoLayout Constraints (Mainly to update Width and Height of UIView)"
  s.homepage         = "https://github.com/damienromito/UIView-UpdateAutoLayoutConstraints"
  s.license          = 'MIT'
  s.author           = { "Damien" => "damien@romito.fr" }
  s.source           = { :git => "https://github.com/damienromito/UIView-UpdateAutoLayoutConstraints.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/damienromito'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'UpdateAutoLayoutConstraints/PodFiles/*.{h,m}'
end

Pod::Spec.new do |s|
  s.name             = "TAPageControl"
  s.version          = "0.1.0"
  s.summary          = "A versatile and easily customizable page control for iOS"
  s.description      = <<-DESC
                       TAPageControl basically is a more powerfull UIPageControl. It offers you greater flexibility and customization. ;)
                       DESC
  s.homepage         = "https://github.com/TanguyAladenise/TAPageControl"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Tanguy Aladenise" => "tanguy.alaedenise@gmail.com" }
  s.source           = { :git => "https://github.com/TanguyAladenise/TAPageControl.git", :tag => '0.1.0' }
  s.social_media_url = 'https://twitter.com/TanguyAladenise'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'TAPageControl'
end

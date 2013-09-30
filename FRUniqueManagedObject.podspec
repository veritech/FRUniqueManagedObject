Pod::Spec.new do |s|
  s.name         = "FRUniqueManagedObject"
  s.version      = "0.0.1"
  s.summary      = "A abstract NSManagedObject subclass for creating unique NSManagedObjects"
  s.description  = <<-DESC
				Ever try to enforce unique entities in your Core Data? You'll like this then.
                   DESC
				   
  s.homepage     = "https://github.com/veritech/FRUniqueManagedObject"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = 'MIT'
  s.author       = { "Jonathan Dalrymple" => "jonathan@float-right.co.uk" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "https://github.com/veritech/FRUniqueManagedObject.git", :commit => "ea9a179f40b2bffdb9695693fa79a5f5216f9d64" }
  s.source_files  = 'Classes', 'FRUniqueManagedObject.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.framework  = 'CoreData'
  s.requires_arc = true
end

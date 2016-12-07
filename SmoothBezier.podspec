Pod::Spec.new do |s|
    s.name         = 'SmoothBezier'
    s.version      = '1.0.0'
    s.summary      = 'A category of UIBezierPath which can help you create smooth bezier path.'
    s.homepage     = 'https://github.com/Zeacone/SmoothBezier'
    s.license      = 'MPL'
    s.authors      = {'Zeacone' => 'andreboot42@gmail.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/Zeacone/SmoothBezier.git', :tag => '1.0.0'}
    s.source_files = 'SmoothBezier/**/*.{h,m}'
    s.requires_arc = true
end
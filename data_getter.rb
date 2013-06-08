require 'googleajax'
GoogleAjax.referer = "your_domain_name_here.com"
GoogleAjax::Search.web("Hello world")[:results][0...3]
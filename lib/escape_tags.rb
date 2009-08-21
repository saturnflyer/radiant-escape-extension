require 'cgi'

module EscapeTags
  include Radiant::Taggable
  include ActionView::Helpers::JavaScriptHelper
  
  desc %{
    Escape carriage returns and single and double quotes for use in Javascript.
  }
  tag 'escape_javascript' do |tag|
    escape_javascript(tag.expand)
  end
  
  desc %{
    Escape characters unsafe for URL parameters.
  }
  tag 'escape_cgi' do |tag|
    CGI::escape(tag.expand)
  end
  
end
module EscapeTags
  include Radiant::Taggable
  include ActionView::Helpers::JavaScriptHelper
  
  desc %{
    Escape carriage returns and single and double quotes for use in Javascript.
  }
  tag 'escape_javascript' do |tag|
    escape_javascript(tag.expand)
  end
  
end
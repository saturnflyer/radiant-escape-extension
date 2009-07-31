# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class EscapeExtension < Radiant::Extension
  version "1.0"
  description "Radius tags for escaping content"
  url "http://saturnflyer.com"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :escape
  #   end
  # end
  
  def activate
    Page.class_eval { include EscapeTags }
  end
  
  def deactivate
    # admin.tabs.remove "Escape"
  end
  
end

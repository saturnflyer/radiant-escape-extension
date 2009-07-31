require File.dirname(__FILE__) + '/../spec_helper'

describe EscapeTags do
  
  before do
    @page = Page.create!(
      :title => 'New Page',
      :slug => 'page',
      :breadcrumb => 'New Page',
      :status_id => '100'
    )
  end
  
  it "should escape the non JS safe characters" do
    @page.should render(%{<r:escape_javascript>This is "where it's at."</r:escape_javascript>}).as('This is \"where it\'s at.\"')
  end
  
end
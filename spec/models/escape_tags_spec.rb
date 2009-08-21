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
  
  describe "escape_javascript" do
    it "should escape the non JS safe characters" do
      @page.should render(%{<r:escape_javascript>This is "where it's at."</r:escape_javascript>}).as(%q{This is \"where it\'s at.\"})
    end
  end
  
  describe "escape_cgi" do
    it "should escape non URL safe characters" do
      @page.should render(%{<r:escape_cgi>This is "where it's at."</r:escape_cgi>}).as("This+is+%22where+it%27s+at.%22")
    end
  end
  
end
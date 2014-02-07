require 'spec_helper'

describe "Pages" do
   subject{page}

   describe "home page" do
   	before{visit root_path}

   	it{should have_content("coalstove")}
   	it{should have_title('coalstove')}
   	it{should_not have_selector('title', text: '| home')}   	
   end
end
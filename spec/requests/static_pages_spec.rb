require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'EBM Wage Portal'" do
      visit '/static_pages/home'
      expect(page).to have_content('EBM Wage Portal')
    end
   it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("EBM Wage Portal | Home")
    end
  end

describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("EBM Wage Portal | Help")
    end
  end
end


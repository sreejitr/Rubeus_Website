require 'spec_helper'

describe 'View Footer' do

  before(:each) do
    visit root_path
  end

  it 'should have all it needs' do
    page.should have_content(Rubeus::ABOUT_US)
    page.should have_content(Rubeus::CONTACT_US)
    page.should have_content(Rubeus::TERMS_AND_CONDITIONS)
  end

  it 'should have name of the Team and Team Members'  do
    click_link Rubeus::ABOUT_US
    page.should have_content(Rubeus::ABOUT_US)
    page.should have_content(Rubeus::ALOK)
    page.should have_content(Rubeus::BRANDON)
    page.should have_content(Rubeus::PUSHKAR)
    page.should have_content(Rubeus::RASHMI)
    page.should have_content(Rubeus::SREEJITA)
    page.should have_content(Rubeus::JOHN)
  end

  it 'should have the Email Id' do
    click_link Rubeus::CONTACT_US
    page.should have_content(Rubeus::TEAM_CONTACT)
  end

  it 'should have the terms and conditions' do
    click_link Rubeus::TERMS_AND_CONDITIONS
    page.should have_content(Rubeus::CONDITIONS)
  end
end
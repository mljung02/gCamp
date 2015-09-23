require 'spec_helper'

describe 'Tasks new' do
  it 'has a description' do
    visit '/tasks/new'
    page.should have_content('Description')
  end
end

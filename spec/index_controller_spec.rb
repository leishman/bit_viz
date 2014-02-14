require 'spec_helper'

describe "IndexController", type: :feature do

    it 'should see homepage' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'should see a sign in on the homepage' do
    	visit '/'
    	expect(page).to have_content('Bit-Viz')
    end

    # it "should redirect the user to Coinbase when signing up" do
    # 	visit '/'
    # 	click_link 'Sign In'
    # 	expect(page).to have_content 'About'
    # end

  # describe 'create a new band' do
  #   band_name = 'chromatics'
  #   new_params = {
  #       name: band_name
  #     }
  #   new_session = {
  #     'rack.session' => {
  #       # Could preload stuff into the session here...
  #     }
  #   }
  #   it 'should add a new band' do
  #     expect{
  #       post('/bands', new_params, new_session)
  #     }.to change(Band, :count).by(1)
  #     last_response.should be_ok
  #     last_response.body.should == band_name
  #   end
  # end
end

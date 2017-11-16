require 'test_helper'

describe HomeController do
  before do
    sign_in customers(:sarah)
  end

  describe 'GET index' do
    it 'responds with :success to authorized user' do
      get home_index_url
      must_respond_with :success
    end

    it 'redirects unauthorized user' do
      sign_out customers(:sarah)
      get home_index_url
      must_redirect_to new_customer_session_url
    end
  end
end

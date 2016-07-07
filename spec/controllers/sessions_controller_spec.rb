require 'rails_helper'

describe SessionsController do
  subject { response }
  let(:account) { create(:account, password: password) }

  describe "POST login" do
    before(:each) { post :create, username: username, password: password }

    context "incorrect login" do
      let(:username) { "bad_username" }
      let(:password) { "bad_password" }

      it { is_expected.to redirect_to new_session_path }
    end

    context "correct login" do
      let(:username) { account.username }
      let(:password) { 'test_password' }

      it { is_expected.to redirect_to root_path }
    end
  end

end

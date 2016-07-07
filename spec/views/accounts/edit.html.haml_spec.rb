require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "MyString",
      :username => "MyString",
      :password_digest => "MyText"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_username[name=?]", "account[username]"

      assert_select "textarea#account_password_digest[name=?]", "account[password_digest]"
    end
  end
end

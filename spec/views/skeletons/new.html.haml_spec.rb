require 'rails_helper'

RSpec.describe "skeletons/new", type: :view do
  before(:each) do
    assign(:skeleton, Skeleton.new(
      :name => "MyString",
      :slug => "MyString",
      :account_id => 1
    ))
  end

  it "renders new skeleton form" do
    render

    assert_select "form[action=?][method=?]", skeletons_path, "post" do

      assert_select "input#skeleton_name[name=?]", "skeleton[name]"

      assert_select "input#skeleton_slug[name=?]", "skeleton[slug]"

      assert_select "input#skeleton_account_id[name=?]", "skeleton[account_id]"
    end
  end
end

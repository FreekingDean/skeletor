require 'rails_helper'

RSpec.describe "skeletons/edit", type: :view do
  before(:each) do
    @skeleton = assign(:skeleton, Skeleton.create!(
      :name => "MyString",
      :slug => "MyString",
      :account_id => 1
    ))
  end

  it "renders the edit skeleton form" do
    render

    assert_select "form[action=?][method=?]", skeleton_path(@skeleton), "post" do

      assert_select "input#skeleton_name[name=?]", "skeleton[name]"

      assert_select "input#skeleton_slug[name=?]", "skeleton[slug]"

      assert_select "input#skeleton_account_id[name=?]", "skeleton[account_id]"
    end
  end
end

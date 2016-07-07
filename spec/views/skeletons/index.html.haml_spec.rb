require 'rails_helper'

RSpec.describe "skeletons/index", type: :view do
  before(:each) do
    assign(:skeletons, [
      Skeleton.create!(
        :name => "Name",
        :slug => "Slug",
        :account_id => 2
      ),
      Skeleton.create!(
        :name => "Name",
        :slug => "Slug",
        :account_id => 2
      )
    ])
  end

  it "renders a list of skeletons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end

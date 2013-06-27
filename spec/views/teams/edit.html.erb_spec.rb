require 'spec_helper'

describe "teams/edit" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :name => "MyString",
      :competition => "MyString",
      :point => 1,
      :ranking => 1
    ))
  end

  it "renders the edit team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", team_path(@team), "post" do
      assert_select "input#team_name[name=?]", "team[name]"
      assert_select "input#team_competition[name=?]", "team[competition]"
      assert_select "input#team_point[name=?]", "team[point]"
      assert_select "input#team_ranking[name=?]", "team[ranking]"
    end
  end
end

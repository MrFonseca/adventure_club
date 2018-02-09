RSpec.describe "list users", type: :feature do
  let!(:user1) { FactoryBot.create(:user, email: "kaaporas@adventure.com") }

  before { visit users_path }

  it "lists all avaliable users" do
    expect(page).to have_content("kaaporas@adventure.com")
  end
end

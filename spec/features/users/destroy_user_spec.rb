RSpec.describe "destroy user", type: :feature do
  let!(:user1) { FactoryBot.create :user }

  before { visit users_path }

  it "removes an existing user" do
    expect do
      click_on "Excluir"
    end.to change(User, :count).by(-1)
    expect(current_path).to eq(users_path)
    expect(page).to have_content("Usuário excluído")
    expect(User.find_by(id: user1.id)).to be_nil
  end
end

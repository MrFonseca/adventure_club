RSpec.describe "edit user", type: :feature do
  let!(:user1) do
    FactoryBot.create(
      :user,
      email: "club@club.com",
      password: "club1234",
      password_confirmation: "club1234",
      role: "financial"
    )
  end

  before do
    visit users_path
    click_on "Editar"
  end

  it "populates the form with exiting data" do
    expect(find_field("E-mail").value).to eq("club@club.com")
    expect(find_field("Perfil de Acesso").text).to have_content("Financial")
  end

  context "with valid input" do
    it "updates new user" do
      fill_in  "E-mail",        with: "user@kaaporas.com.br"
      fill_in  "Senha",         with: "club1234"
      fill_in  "Repetir senha", with: "club1234"
      select   "Manager",       from: "Perfil de Acesso"
      click_on "Enviar dados"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Usuário editado")
      user1.reload
      expect(user1).to have_attributes(
        email: "user@kaaporas.com.br",
        role: "manager"
      )
    end
  end

  context "with invalid input" do
    it "displays errors" do
      fill_in "E-mail", with: ""
      fill_in "Senha", with: "club1234"
      fill_in "Repetir senha", with: "club1234"
      select "Manager", from: "Perfil de Acesso"
      click_on "Enviar dados"

      expect(page).to have_content("can't be blank")
    end
  end
end

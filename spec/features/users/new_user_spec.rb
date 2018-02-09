RSpec.describe "new user", type: :feature do
  before { visit new_user_path }

  context "with valid input" do
    it "creates new user" do
      fill_in "E-mail", with: "user@kaaporas.com.br"
      fill_in "Senha", with: "user123"
      fill_in "Repetir senha", with: "user123"
      select "Manager", from: "Perfil de Acesso"
      click_on "Enviar dados"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Usuário criado")
      expect(User.last).to have_attributes(
        email: "user@kaaporas.com.br",
        role: "manager"
      )
    end
  end

  context "with invalid input" do
    it "displays errors" do
      fill_in "E-mail", with: ""
      fill_in "Senha", with: "user123"
      fill_in "Repetir senha", with: "user123"
      select "Manager", from: "Perfil de Acesso"
      click_on "Enviar dados"

      expect(page).to have_content("can't be blank")
    end
  end
end

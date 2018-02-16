RSpec.describe "edit user", type: :feature do
  let!(:user1) do
    FactoryBot.create(
      :user,
      email: "club@club.com",
      password: "club1234",
      password_confirmation: "club1234",
      role: "Tesoureiro",
      registration_date: "2008-03-25"
    )
  end

  before do
    visit users_path
    click_on "Editar"
  end

  it "populates the form with exiting data" do
    expect(find_field("E-mail").value).to eq("club@club.com")
    expect(find_field("user_role_tesoureiro").checked?).to be_truthy
    expect(find_field("user_registration_date_3i").text).to have_content("25")
    expect(find_field("user_registration_date_2i").text).to have_content("3")
    expect(find_field("user_registration_date_1i").text).to have_content("2008")
  end

  context "with valid input" do
    it "updates new user" do
      fill_in  "E-mail",        with: "user@kaaporas.com.br"
      fill_in  "Senha",         with: "club1234"
      fill_in  "Repetir senha", with: "club1234"
      choose "user_role_gestor"
      select "10", from: "user_registration_date_3i"
      select "10", from: "user_registration_date_2i"
      select "2010", from: "user_registration_date_1i"
      click_on "Enviar dados"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Usuário editado")
      user1.reload
      expect(user1).to have_attributes(
        email: "user@kaaporas.com.br",
        role: "Gestor"
      )
    end
  end

  context "with invalid input" do
    it "displays errors" do
      fill_in "E-mail", with: ""
      fill_in "Senha", with: "club1234"
      fill_in "Repetir senha", with: "club1234"
      choose "user_role_gestor"
      select "10", from: "user_registration_date_3i"
      select "10", from: "user_registration_date_2i"
      select "2010", from: "user_registration_date_1i"
      click_on "Enviar dados"

      expect(page).to have_content("can't be blank")
    end
  end
end

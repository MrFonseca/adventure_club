class AddRegistrationDateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :registration_date, :date
  end
end

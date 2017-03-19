namespace :users do
  task create_admin: :environment do
    User.new(rut: '15830608-5',
             password: 'adminpass',
             admin: true,
             name: 'admin',
             office: Office.first)
      .save!
  end

end

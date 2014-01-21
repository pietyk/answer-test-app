# encoding: utf-8
ActiveAdmin.register User do
  menu :label => 'Użytkownicy'

  index :title => 'Użytkownicy' do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  show do |ad|
    attributes_table do
      row :id
      row :email
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
    end
    active_admin_comments
  end

  filter :email

  form do |f|
    f.inputs "Użytkownicy" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end


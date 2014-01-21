ActiveAdmin.register Answer do
  belongs_to :question

  index :title => 'Odpowiedzi' do
    column :id
    column :text
    column :is_correct
    actions
  end

  show do |ad|
    attributes_table do
      row :id
      row :text
      row :is_correct
    end
    active_admin_comments
  end

  filter :text

  form do |f|
    f.inputs "Odpowiedź" do
      f.input :text
      f.input :is_correct
    end
    f.actions
  end
end


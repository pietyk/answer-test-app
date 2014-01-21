ActiveAdmin.register Poll do
  menu :label => 'Testy'

  action_item :only => :show do
    link_to('Nowy test', new_admin_poll_path())
  end

  action_item :only => :show do
    link_to('Nowe pytanie', new_admin_poll_question_path(params[:id]))
  end

  index :title => 'Testy' do
    column :id
    column :name
    column :created_at
    actions do |poll|
      link_to "Pytania", admin_poll_questions_path(poll), :class => "member_link"
    end
  end

  show do |ad|
    attributes_table do
      row :id
      row :name
      row :slug
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :name

  form do |f|
    f.inputs "Test" do
      f.input :name
    end
    f.actions
  end
end


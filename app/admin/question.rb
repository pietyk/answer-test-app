#encoding: utf-8
ActiveAdmin.register Question do
  belongs_to :poll

  action_item :only => :show do
    link_to('Nowe pytanie', new_admin_poll_question_path(params[:poll_id]))
  end
  
  action_item :only => :show do
    link_to('Nowa odpowiedź', new_admin_question_answer_path(params[:id]))
  end

  index :title => 'Odpowiedzi' do
    column :id
    column :text
    actions do |question|
      link_to "Odpowiedzi", admin_question_answers_path(question), :class => "member_link"
    end
  end

  show do |ad|
    attributes_table do
      row :id
      row :text
    end
    active_admin_comments
  end

  filter :text

  form do |f|
    f.inputs "Odpowiedź" do
      f.input :text
    end
    f.actions
  end
end


ActiveAdmin.register Advertising do

  permit_params :title, :body, :audience, :conference_id

  index do
    column :title
    column :audience
    column :conference do |a|
     (l(a.conference.start_at, :format => :short) + '&ndash;' + l(a.conference.end_at, :format => :short) + '<br/>' + a.conference.end_at.year.to_s).html_safe
    end
    default_actions
  end

  show do
    attributes_table do
      row :title
      row :audience
      row :body
      row :conference
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :conference, :as => :select, :input_html => { :class => 'chosen-select', "data-placeholder" => 'Click' }, :selected => Conference.last.id
      f.input :title
      f.input :audience
      f.input :body
    end
    f.actions
  end
  
end

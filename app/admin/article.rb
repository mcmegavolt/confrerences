ActiveAdmin.register Article do

  permit_params :title, :entry, :file, :author, :conference_id

  index do
    column :title
    column :author
    column :file do |x|
      link_to 'Download', x.file_url
    end
    default_actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :entry
      row :conference
      row :category
      row :file do |x|
        link_to 'Download', x.file_url
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :conference, :as => :select, :input_html => { :class => 'chosen-select', "data-placeholder" => 'Click' }, :selected => Conference.last.id
      # f.input :category
      f.input :title
      f.input :author
      f.input :entry
      f.input :file
    end
    f.actions
  end


end

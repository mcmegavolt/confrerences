ActiveAdmin.register Article do

  permit_params :title, :entry, :file, :author, :conference_id, :category_id

  index do
    column :title
    column :author
    column :category
    column :conference do |a|
     (l(a.conference.start_at, :format => :short) + '&ndash;' + l(a.conference.end_at, :format => :short) + '<br/>' + a.conference.end_at.year.to_s).html_safe
    end
    # column :file do |x|
    #   link_to 'Download', x.file_url
    # end
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
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :conference, :as => :select, :input_html => { :class => 'chosen-select', "data-placeholder" => 'Click' }, :selected => Conference.first.id
      f.input :category, :as => :select, :input_html => { :class => 'chosen-select', "data-placeholder" => t(:'most_common.click_to_select') }
      f.input :title
      f.input :author
      f.input :entry
      f.input :file
    end
    f.actions
  end


end

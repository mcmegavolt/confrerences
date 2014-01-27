ActiveAdmin.register Conference do

 permit_params :title, :description, :file, :start_at, :end_at, :picture

  index do
    column :title
    # column :picture do |pic|
    # end
    column :file do |x|
      link_to 'Download', x.file_url
    end
    column :start_at
    column :end_at
    default_actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :start_at
      row :end_at
      # row :picture do
      #   image_tag conference.picture_url(:small)
      # end
      row :file do
        link_to 'Download', conference.file_url
      end
    end
  end

  form do |f|
    f.inputs "Conference" do
      f.input :title
      f.input :description
      f.input :start_at
      f.input :end_at
      f.input :picture
      f.input :file
    end
    f.actions
  end
  
end

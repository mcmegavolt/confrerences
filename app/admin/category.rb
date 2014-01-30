ActiveAdmin.register Category do

  permit_params :title, :icon, :picture

  index do
    column :title
    column :icon do |pic|
    end
    column :picture do |pic|
    end

    default_actions
  end

  show do
    attributes_table do
      row :title
      row :picture do
        # image_tag category.picture_url(:small)
      end
      row :icon do
        # image_tag category.picture_url(:small)
      end
    end
  end

end

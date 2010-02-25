class AddTitleToGoogleForms < ActiveRecord::Migration
  def self.up
    add_column :google_forms, :title, :string
    
    GoogleForm.all.each do |form|
      form.title = form.slug
      form.save
    end
  end

  def self.down
    remove_column :google_forms, :title
  end
end

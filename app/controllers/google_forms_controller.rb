class GoogleFormsController < InheritedResources::Base
  def create
    create! do |format|
      format.html { redirect_to google_forms_path }
    end
  end
end

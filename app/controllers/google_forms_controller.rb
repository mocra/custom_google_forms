class GoogleFormsController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html do
        flash[:notice] = "Your form '#{@google_form.title}' has been successfully customized."
        redirect_to google_forms_path
      end
      failure.html do
        flash.now[:error] = "We could not validate your form key."
        render :new
      end
    end
  end
end

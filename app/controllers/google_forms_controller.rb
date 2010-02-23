class GoogleFormsController < InheritedResources::Base
  def show
    show! do |format|
      @view_form_url = "/#{@google_form.slug}"
      format.html
    end
  end
end

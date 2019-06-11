module ApplicationHelper
  def form_auth
    "<input type=hidden name=authenticity_token value=form_authenticity_token>".html_safe
  end

  def form_delete
    "<input type=hidden name=_method value=DELETE>".html_safe
  end

  def form_patch
    "<input type=hidden name=_method value=PATCH>".html_safe
  end
end

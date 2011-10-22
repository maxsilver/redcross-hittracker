module ApplicationHelper

  def menu_is_selected(name)
    "selected" if request.path.index(name)
  end

end

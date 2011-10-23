module ApplicationHelper
  def menu_is_selected(name)
    "selected" if request.path.index(name)
  end

  def reporter_options
    Reporter.all
  end
  
  def chapter_options
    Chapter.all
  end
  
  def press_release_options
    PressRelease.all
  end
  
  def media_outlet_options
    MediaOutlet.all
  end
end

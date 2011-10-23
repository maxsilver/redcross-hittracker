module ApplicationHelper
  def menu_is_selected(name)
    "selected" if request.path.index(name)
  end

  def reporter_options
    Reporter.not_deleted
  end
  
  def chapter_options
    Chapter.not_deleted
  end
  
  def press_release_options
    PressRelease.not_deleted
  end
  
  def media_outlet_options
    MediaOutlet.not_deleted
  end
  
  def first_press_release_date
    PressRelease.not_deleted.earliest.released_on.to_s(:db) if PressRelease.earliest
  end
  
  def last_press_release_date
    PressRelease.not_deleted.latest.released_on.to_s(:db) if PressRelease.latest
  end
end

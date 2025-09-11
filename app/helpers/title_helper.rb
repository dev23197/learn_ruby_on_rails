module TitleHelper
  def html_title
    content_for(:html_title) || "Default Title"
  end
end

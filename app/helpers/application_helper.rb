module ApplicationHelper
  def markdown(text)
    renderOptions = {hard_wrap: true}
    markdownOptions = {autolink: true, no_intra_emphasis: true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderOptions), markdownOptions)
    markdown.render(text).html_safe
  end

  def site_name
    "2game5me"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://www.2game5me.com"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    ""
  end

  def meta_description
    "A  driven by TDD."
  end

  def meta_keywords
    ""
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-danger"
      when "notice"
        "alert-success"
      when "info"
        "alert-info"
      when "warning"
        "alert-warning"
      else
        flash_type.to_s
    end
  end
end

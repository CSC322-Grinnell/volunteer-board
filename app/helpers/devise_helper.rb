module DeviseHelper
=begin
  def devise_error_messages!
    messages = resource.errors.full_messages.join("<br/>").html_safe
    flash[:notice] = messages
    ""
  end
=end

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.join("<br/>")
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="devise_error_messages">
      <h3>#{sentence}</h3>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

=begin
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
      </button>
      <strong>
       #{pluralize(resource.errors.count, "error")} must be fixed
      </strong>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
=end
end
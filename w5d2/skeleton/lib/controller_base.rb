require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @req = req
    @res = res
    @already_built_response = false
    @params = req.params.merge(route_params)
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Already Contains Response" if already_built_response?
    res['Location']=(url)
    res.status = 302
    session.store_session(res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Already Contains Response" if already_built_response?
    res['Content-Type'] = content_type
    res.body = [content]
    session.store_session(res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s.underscore
    # dirpath = File.dirpath(__FILE__)
    template_file = "views/#{controller_name}/#{template_name.to_s.underscore}.html.erb"
    # read contents from template file from the path
    contents = File.read(template_file)
    erb_template = ERB.new("<%= contents %>")
    content = erb_template.result(binding)
    render_content(content, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    self.render(name) unless already_built_response?
  end
end

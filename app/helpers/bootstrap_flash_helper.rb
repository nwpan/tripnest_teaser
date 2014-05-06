# see: https://github.com/seyhunak/twitter-bootstrap-rails/blob/master/app/helpers/bootstrap_flash_helper.rb
module BootstrapFlashHelper
  ALERT_TYPES = [:danger, :info, :success, :warning] unless const_defined?(:ALERT_TYPES)
  DISPLAY_TYPES = [:application, :modal] unless const_defined?(:DISPLAY_TYPES)

  def bootstrap_flash(display_type = 'application')
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger   if type == :alert
      next unless ALERT_TYPES.include?(type)


      display_type = display_type.to_sym
      display_type = :application if display_type == :application
      next unless DISPLAY_TYPES.include?(display_type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg, :class => "alert fade in alert-#{type}", :id => "flash_#{display_type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
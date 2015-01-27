module Locksmith
  module ApplicationHelper
    # Displays the validation errors for the specified model and attribute if there are any
    def errors_for(model, attribute, name = nil)
      name = attribute.capitalize if name.nil?

      if model.errors[attribute].present?
        content_tag(:ul, class: 'errors') do
          # Loop over every error
          model.errors.messages[attribute].map do |error|
            # Display the error and the field name
            content_tag(:li, "#{name} #{error}")
          # Concatenate the li tags using reduce to not make outer content_tag escape the inner
          end.reduce(:<<)
        end
      end
    end
  end
end

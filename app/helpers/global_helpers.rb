module Merb
  module GlobalHelpers

    def form_row label, content
      label + "<p>" + content + "</p>"
    end

  end
end

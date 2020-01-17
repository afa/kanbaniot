Rails.logger.info('tst')
module Kaniot
  class Hooks < Redmine::Hook::ViewListener
    render_on( :view_layouts_base_html_head, template: 'add_fields' )
  end
end

# Order configuration menu
Deface::Override.new(
  virtual_path:  "spree/admin/shared/_order_tabs",
  name:          "add_notes_tab_in_admin_order_configuration_menu",
  insert_top: "[data-hook='admin_order_tabs_payments']",
  text: <<-HTML
        <% if SpreeNotes::Config[:noteables].include?('orders') %>
          <%= render partial: 'spree/admin/shared/notes_tab', locals: { resource: @order, current: current } %>
        <% end %>
  HTML
)

# User configuration menu
Deface::Override.new(
  virtual_path:  "spree/admin/users/_sidebar",
  name:          "add_notes_tab_in_admin_user_sidebar",
  insert_bottom: "[data-hook='admin_user_tab_options']",
  text: <<-HTML
        <% debugger %>
        <% if SpreeNotes::Config[:noteables].include?('users') %>
          <%= render partial: 'spree/admin/shared/notes_tab', locals: { resource: @user, current: current } %>
        <% end %>
  HTML
)

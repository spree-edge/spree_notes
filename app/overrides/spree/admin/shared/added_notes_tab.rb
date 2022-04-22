# Order sidebar menu
Deface::Override.new(
  virtual_path:  "spree/admin/shared/_order_tabs",
  name:          "add_notes_tab_in_admin_order_configuration_menu",
  insert_top: "[data-hook='admin_order_tabs_payments']",
  text: "<%= render partial: 'spree/admin/shared/notes_tab', locals: { resource: @order, current: current } %>"
)

# User sidebar menu
Deface::Override.new(
  virtual_path:  "spree/admin/users/_sidebar",
  name:          "add_notes_tab_in_admin_user_sidebar",
  insert_bottom: "[data-hook='admin_user_tab_options']",
  text: "<%= render partial: 'spree/admin/shared/notes_tab', locals: { resource: @user, current: current } %>"
)

# Product sidebar menu
Deface::Override.new(
  virtual_path:  "spree/admin/shared/_product_tabs",
  name:          "add_notes_tab_in_admin_product_sidebar",
  insert_bottom: "[data-hook='admin_product_tabs']",
  text: "<%= render partial: 'spree/admin/shared/notes_tab', locals: { resource: @product, current: current } %>"
)
# Notes setting configuration submenu
Deface::Override.new(
  virtual_path:  "spree/admin/shared/sub_menu/_configuration",
  name:          "added_notes_setting_to_configuration_menu",
  insert_after: "erb[loud]:contains('if can? :manage, Spree::Role')",
  text: "<%= configurations_sidebar_menu_item(Spree.t(:note_setting), spree.edit_admin_note_settings_path) if can? :manage, Spree::Config %>"
)

Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.add_to_section('settings',
      ::Spree::Admin::MainMenu::ItemBuilder.new('note_settings', ::Spree::Core::Engine.routes.url_helpers.edit_admin_note_settings_path).
        with_manage_ability_check(::Spree::Config).
        with_match_path('/note_settings').
        build
    )
  end
end

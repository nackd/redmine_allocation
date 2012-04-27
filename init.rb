require 'redmine'

Redmine::Plugin.register :redmine_traceability do
  Rails.configuration.after_initialize do
    I18n.with_locale(Setting.default_language) do
      name I18n.t :'allocation.plugin_name'
      description I18n.t :'allocation.plugin_description'
    end
  end
  author 'Emergya'
  version '0.1'

  project_module :allocation do
  end
end

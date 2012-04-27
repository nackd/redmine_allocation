require 'redmine'

require_dependency 'allocation/hooks'

Redmine::Plugin.register :redmine_traceability do
  Rails.configuration.after_initialize do
    locale = if Setting.table_exists?
               Setting.default_language
             else
               'en'
             end

    I18n.with_locale(locale) do
      name I18n.t :'allocation.plugin_name'
      description I18n.t :'allocation.plugin_description'
      author 'Emergya'
      version '0.1'
    end
  end

  project_module :allocation do
  end
end

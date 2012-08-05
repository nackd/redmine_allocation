require_dependency 'projects_controller'

module Allocation
  module Patches
    module ProjectsControllerPatch
      def self.included(base) # :nodoc:
        base.class_eval do
          unloadable # Send unloadable so it will be reloaded in development

          helper :allocation
        end
      end
    end
  end
end

if Rails::VERSION::MAJOR > 1
  ActionDispatch::Reloader.to_prepare do
    ProjectsController.send(:include, Allocation::Patches::ProjectsControllerPatch)
  end
else
  Dispatcher.to_prepare do
    ProjectsController.send(:include, Allocation::Patches::ProjectsControllerPatch)
  end
end

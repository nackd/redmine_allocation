module AllocationHelper
  unloadable

  def percent(n)
    "#{n.round(2) rescue n} %"
  end

  def allocation_form(member, &block)
    if Redmine::VERSION::MAJOR > 1 or (Redmine::VERSION::MAJOR == 1 and Redmine::VERSION::MINOR >= 4)
      url = membership_path(member)
      method = :put
    else
      url = {:controller => 'members', :action => 'edit', :id => member}
      method = :post
    end
    if Redmine::VERSION::MAJOR > 1
      form_for(member,
               :as => :allocation,
               :remote => true,
               :url => url,
               :method => method) do |f|
        # Object#define_singleton_method is only available in Ruby >= 1.9.1
        metaclass = class << f; self; end
        metaclass.send :define_method, :url do
          url
        end
        metaclass.send :define_method, :method do
          method
        end
        yield f
      end
    else
      remote_form_for(:allocation,
                      member,
                      :url => url,
                      :method => method) do |f|
        # Object#define_singleton_method is only available in Ruby >= 1.9.1
        metaclass = class << f; self; end
        metaclass.send :define_method, :url do
          url
        end
        metaclass.send :define_method, :method do
          method
        end
        yield f
      end
    end
  end
end

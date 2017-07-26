module SoftDestroy
  require 'soft_destroy/override_methods'

  class ActiveRecord::Base
    alias_method :active_record_delete, :delete


    def self.soft_destroy_enabled?
      false
    end

    def soft_destroy_enabled?
      self.class.soft_destroy_enabled?
    end

    def self.enable_soft_destroy
      include SoftDestroyOverrideMethods
    end
  end
end
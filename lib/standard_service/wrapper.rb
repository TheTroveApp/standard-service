module StandardService
  module Wrapper
    def self.included(klass)
      class << klass
        def service(&block)
          define_method '_run', &block
        end

        def call(params = {})
          service = new(params)
          data = service._run

          StandardService::Result.new(data, service._conditions, service._meta)
        end
      end
    end

    def initialize(params = {})
      params.to_h.each do |(name, value)|
        instance_variable_set("@#{name}", value)
      end
    end

    def _conditions
      @_conditions ||= {}
    end

    def _meta
      @_meta ||= {}
    end

    def add_condition(type, desc)
      _conditions[type.to_sym] = desc.to_s
    end

    def add_meta(type, desc)
      _meta[type.to_sym] = desc.to_s
    end
  end
end

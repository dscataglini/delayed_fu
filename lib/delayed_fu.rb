require "delayed_fu/version"

module DelayedFu
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  class DelayedMethod
    def initialize(target)
      @target = target
    end

    def respond_to?(method_name, *args, &block)
      @target.respond_to?(method_name)
    end

    def method_missing(method_name, *args, &block)
      raise NoMethodError.new("undefined method `#{method_name}' for #{@target.inspect}") unless respond_to?(method_name, *args, &block)
      if @target.class == Class && defined?(Job)
        Job.enqueue!(@target.to_s, "class.#{method_name}", *args)
      else
        Job.enqueue!(@target.class.to_s, method_name.to_s, *args)
      end
    end
  end

  module InstanceMethods
    def delay
      DelayedMethod.new(self)
    end
  end

  module ClassMethods
    include InstanceMethods
  end
end


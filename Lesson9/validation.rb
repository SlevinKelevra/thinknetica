module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attr, type, *arg)
      @validations ||= []
      @validations << { attr.to_sym => [type.to_sym, arg.first].compact }
      @validations.uniq!
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get(:@validations).each do |val|
        self.send "#{val.values[0].first}!", val.keys[0], val.values[0].last
      end
    end

    def valid?
      begin
        validate!
        true
      rescue
        false
      end
    end

    private

    def var_value(attr)
      self.instance_variable_get("@#{attr}")
    end

    def presence!(attr, *value)
      if var_value(attr).nil? || var_value(attr).to_s.empty?
        raise "'#{attr}' is nil or empty"
      end
    end

    def format!(attr, value)
      unless var_value(attr) =~ value
        raise "Wrong format of argument:'#{attr}'"
      end
    end

    def type!(attr, value)
      unless var_value(attr).is_a?(value)
        raise "Wrong type of argument:'#{attr}'"
      end
    end
  end
end

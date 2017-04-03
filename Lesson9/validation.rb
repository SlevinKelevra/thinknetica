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
    def validate!(attr)
      self.class.instance_variable_get(:@validations).each do |attr, args|
      self.send "#{args.values[0].first}!", args.keys[0], args.values[0].last
      return self.instance_variable_get("@#{attr}")
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

    def presence!(validate!, *value)
      raise "'#{validate!}' is nil or empty" if validate!.nil? || validate!.to_s.empty?
    end

    def format!(validate!, value)
      raise "Wrong format of argument:'#{validate!}'" unless validate! =~ value
    end

    def type!(attr, value)
      raise "Wrong type of argument:'#{attr}'" unless validate!.is_a?(value)
    end
  end
end

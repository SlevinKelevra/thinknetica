module Acessors
  def attr_accessor_with_history (*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        @history ||= {}
        @history[var_name] ||= []
        @history[var_name] << value
      end
      define_method("#{name}_history") { @history[var_name] }
    end
  end

  def strong_attr_acessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Wrong variable type' unless value.class.to_s == type.to_s
      instance_variable_set(var_name, value)
    end
  end

end

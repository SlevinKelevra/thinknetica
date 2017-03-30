module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :count
  end

  module InstanceMethods
    private

    def register_instance
      self.class.count ||= 0
      self.class.count += 1
    end
  end
end

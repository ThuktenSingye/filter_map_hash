# frozen_string_literal: true

# Filter Map Hash Module
module FilterMapHash
  def self.filter_map_hash(hash)
    result = {}
    hash.each do |k, v|
      transformed = yield(k, v)
      result[k] = transformed if transformed
    end
    result
  end

  module InstanceMethods
    def filter_map_hash(&block)
      FilterMapHash.filter_map_hash(self, &block)
    end
  end
end

class Hash
  include FilterMapHash::InstanceMethods
end

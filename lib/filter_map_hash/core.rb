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
end

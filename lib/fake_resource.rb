# FakeResource
# defines the abstract resource class
#
# Override `attributes` in the subclass to provide the hash that will be rendered
# Note: this is a bit rough, but it'll do for now.
module FakeResource
  def self.collection(count)
    items = count.times.map do
      new.to_h
    end

    items.sort do |a, b|
      a[:item][:timestamp] <=> b[:item][:timestamp]
    end
  end

  attr_accessor :attrs

  def initialize
    self.attrs = attributes
  end

  def to_h
    attrs
  end

  def attributes
    raise "write me!"
  end
end


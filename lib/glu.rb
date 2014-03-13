begin
  RUBY_VERSION =~ /(\d+.\d+)/
  require "glu/#{$1}/glu"
rescue LoadError
  require 'glu/glu'
end

# (Glu.)gluSphere -> GLU.Sphere
# (Glu::)GLU_INSIDE -> GLU::INSIDE
module GLU
  extend self
  include Glu

  Glu.constants.each do |cn|
    n = cn.to_s.sub(/^GLU_/,'')
    const_set( n, Glu.const_get( cn ) )
  end

  Glu.methods( false ).each do |mn|
    n = mn.to_s.sub(/^glu/,'')
    alias_method( n, mn )
    public( n )
  end
end

module Glu
  VERSION = "8.1.0"
end
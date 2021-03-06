require_relative 'bootscale/version'

module Bootscale
  DOT_SO = '.so'.freeze
  DOT_RB = '.rb'.freeze
  LEADING_SLASH = '/'.freeze

  class << self
    attr_reader :cache, :cache_directory

    def cache_builder
      @cache_builder ||= CacheBuilder.new
    end

    def regenerate
      cache.reload
    end

    def setup(options = {})
      @cache_directory = options[:cache_directory]
      @cache = Cache.new(cache_directory)
      require_relative 'bootscale/core_ext'
    end
  end
end

require_relative 'bootscale/entry'
require_relative 'bootscale/cache_builder'
require_relative 'bootscale/cache'

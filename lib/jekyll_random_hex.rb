# frozen_string_literal: true

require "jekyll"
require "jekyll_plugin_logger"
require "securerandom"
require_relative "jekyll_random_hex/version"

module JekyllPluginRandomNumberTagName
  PLUGIN_NAME = "random_hex_string"
end

module Jekyll
  class RandomNumberTag < Liquid::Tag
    # Called by Jekyll only once to register the module.
    # @param tag_name [String] Describe this parameter's purpose
    # @param text [String] Describe this parameter's purpose
    # @param context [String] Describe this parameter's purpose
    # @return [String, nil] Describe the return value
    def initialize(tag_name, text, context)
      super
      text.to_s.strip!
      if text.empty?
        @n = 6
      else
        tokens = text.split
        abort "random_hex_string error - more than one token was provided: '#{text}'" if tokens.length > 1
        not_integer = !Integer(text, :exception => false)
        abort "random_hex_string error: '#{text}' is not a valid integer" if not_integer
        @n = text.to_i
      end
    end

    def render(_)
      SecureRandom.hex(@n)
    end
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllPluginRandomNumberTagName::PLUGIN_NAME} v#{JekyllRandomHex::VERSION} plugin." }

Liquid::Template.register_tag(JekyllPluginRandomNumberTagName::PLUGIN_NAME, Jekyll::RandomNumberTag)

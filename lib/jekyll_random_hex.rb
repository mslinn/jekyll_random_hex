# frozen_string_literal: true

require "jekyll_plugin_logger"
require "liquid"
require "securerandom"
require_relative "jekyll_random_hex/version"

module JekyllPluginRandomNumberTagName
  PLUGIN_NAME = "random_hex_string"
end

class RandomNumberTag < Liquid::Tag
  # Called by Jekyll only once to register the tag.
  # @param tag_name [String] is the name of the tag, which we already know.
  # @param argument_string [String] the arguments from the web page.
  # @param tokens [Liquid::ParseContext] tokenized command line
  # @return [void]
  def initialize(tag_name, text, context)
    super
    compute_random text
  end

  # @param _ [Liquid::Context]
  # @return [String]
  def render(_)
    SecureRandom.hex(@n)
  end

  private

  def compute_random(text)
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
end

PluginMetaLogger.instance.info { "Loaded #{JekyllPluginRandomNumberTagName::PLUGIN_NAME} v#{JekyllRandomHexVersion::VERSION} plugin." }

Liquid::Template.register_tag(JekyllPluginRandomNumberTagName::PLUGIN_NAME, RandomNumberTag)

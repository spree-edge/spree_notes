module SpreeNotes
  VERSION = '0.0.1'.freeze

  module_function

  # Returns the version of the currently loaded SpreeNotes as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION
  end
end

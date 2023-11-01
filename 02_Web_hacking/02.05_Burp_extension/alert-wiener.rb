require 'java'
java_import 'burp.IBurpExtender'

# Homepage: https://portswigger.net/burp/extender
# API Javadocs: https://portswigger.net/burp/extender/api/
# Article: https://portswigger.net/burp/extender/writing-your-first-burp-suite-extension
class BurpExtender
  # All extensions must implement this interface. Implementations must be called BurpExtender, in the package burp, must be declared public, and must provide a default (public, no-argument) constructor.
  include IBurpExtender

  # This method is invoked when the extension is loaded. It registers an instance of the IBurpExtenderCallbacks interface, providing methods that may be invoked by the extension to perform various actions.
  def registerExtenderCallbacks(callbacks)
    # This method is used to set the display name for the current extension, which will be displayed within the user interface for the Extender tool.
    callbacks.setExtensionName('CodeRed Demo Alert')
    # This method can be used to display a specified message in the Burp Suite alerts tab.
    callbacks.issueAlert('First extension ever!')

    # obtain output and error streams
    stdout = java.io.PrintWriter.new callbacks.getStdout, true
    stderr = java.io.PrintWriter.new callbacks.getStderr, true
    # write a message to our output stream
    stdout.println "Normal message to ouput stream"
    # write a message to our error stream
    stderr.println "Error message to output stream"
  end
end
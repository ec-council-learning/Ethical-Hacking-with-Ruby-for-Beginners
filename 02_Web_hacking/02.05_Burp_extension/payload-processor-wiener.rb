java_import 'burp.IBurpExtender'
java_import 'burp.IIntruderPayloadProcessor'

class BurpExtender
  include IBurpExtender, IIntruderPayloadProcessor

  #
  # implement IBurpExtender
  #

  def registerExtenderCallbacks(callbacks)
    # obtain an extension helpers object
    @helpers = callbacks.getHelpers

    # set our extension name
    callbacks.setExtensionName "CodeRed Demo Payload Processor"

    # register ourselves as an Intruder payload processor
    callbacks.registerIntruderPayloadProcessor self
  end

  #
  # implement IIntruderPayloadProcessor
  #

  def getProcessorName()
    "To binary (MSB)"
  end

  def processPayload(currentPayload, originalPayload, baseValue)
    @helpers.stringToBytes(@helpers.bytesToString(currentPayload).unpack1('B*'))
  end
end

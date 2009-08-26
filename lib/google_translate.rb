#require 'open-uri'
require 'net/http'
require 'cgi'
require 'rubygems'
require 'json'

# google translate API gem
# This is based on the documentation found here
# http://code.google.com/apis/ajaxlanguage/documentation/#Versioning
# look for the paragraph 'Flash and other Non-Javascript Environments'
#
# look at the Translator and LanguageDetect class (or README file) for instructions
module GoogleTranslate
  HOSTNAME = "ajax.googleapis.com"
  PATH ="/ajax/services/language/"
  VERSION = "1.0"
  #USERAGENT = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1'

end

require 'google_translate/exceptions'
require 'google_translate/languages'
require 'google_translate/parsed_response'
require 'google_translate/api_call'
require 'google_translate/translator'
require 'google_translate/language_detect' 

# Fileclient
require 'active_support'
require 'app/models/has_translation'
require 'app/models/has_translation/translation'
require 'app/helpers/set_locale_helper'
include SetLocaleHelper

#ALLOWING FALLBACK !!!!
require "i18n/backend/fallbacks" 
require 'app/models/i18n_backend_availible_locales'
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)

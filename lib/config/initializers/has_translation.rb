#ALLOWING FALLBACK !!!!
require "i18n/backend/fallbacks" 
require 'app/models/i18n_backend_availible_locales'
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.fallbacks[:cz] = [:cz, :en, :es]
I18n.fallbacks[:es] = [:es, :en, :cz]
I18n.fallbacks[:en] = [:en, :es, :cz]

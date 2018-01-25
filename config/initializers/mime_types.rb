# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
Mime::Type.register "application/vnd.azendoo+json; version=1", :API_V1, %w( application/vnd.azendoo+json )
Mime::Type.register "application/vnd.azendoo+json; version=2", :API_V2

ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::API_V1] = :json

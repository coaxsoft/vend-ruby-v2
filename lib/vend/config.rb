module Vend
  class Config < Hashie::Mash
    def api_url
      "https://#{domain_prefix}.vendhq.com/api"
    end
  end
end

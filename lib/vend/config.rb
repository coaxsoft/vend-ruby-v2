module Vend
  class Config < Hashie::Mash
    def api_url
      "https://#{domain_prefix}.vendhq.com/api/2.0"
    end
  end
end

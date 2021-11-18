class JsonWebToken
  class << self
    SALTY = '07987fe0912905527d899213d65029b6aafb26f2d271fd23ba26eb0ddf7be278e0aa7df2fef6eac2a8c633b32633beb53923490b2e40ff21a168ea1a461a1e14'
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SALTY)
    end
 
    def decode(token)
      body = JWT.decode(token, SALTY)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
 end
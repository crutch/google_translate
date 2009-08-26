module GoogleTranslate
  module ApiCall
    def google_api_call(service,params,response_class,get=false)
      data = []
      params.each_pair {|key, value| data << "#{key}=#{value}" }
      data_string = data.join('&')
      headers = {
        'Referer' => 'http://www.here-goes-a-referreri',
        'Content-Type' => 'application/x-www-form-urlencoded',
      }

      if(get)
        require 'uri'
        response = Net::HTTP.get(URI.parse("http://#{HOSTNAME}#{PATH}#{service}?#{data_string}"))
      else
        response = Net::HTTP.new(HOSTNAME).post(PATH + service,data_string,headers)
      end

      raise GoogleUnavailable if response.nil? || response == ""
      raise GoogleException if !get && response.code.to_i != 200
      
      if(get)
        parsed_response = response_class.new(response)
      else
        parsed_response = response_class.new(response.body)
      end
      
      parsed_response # return response class
    end
  end
end

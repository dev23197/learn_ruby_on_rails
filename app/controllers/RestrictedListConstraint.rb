class RestrictedListConstraint
  def initialize
    @ips = RestrictedList.retrieve_ips
  end


  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end

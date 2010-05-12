module CommonMethods
   # base64 decode
  def base64Decode(str)
    if !str.nil?
      return str.unpack("m").first
    end
    return str
  end
  # basse 64 encode
  def base64Encode(bin)
    if !bin.nil?
      return [bin].pack("m")
    end
    return bin
  end
end
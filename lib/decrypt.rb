class Decrypt < Encrypt
  def decrypt
    Enigma.split_by_fours(@message).map do |sub_message|
      sub_message.map.with_index do |char, index|
        rotation = @map.index(char) - @offsets[index]
        @map.rotate(rotation).first
      end
    end.join
  end
end

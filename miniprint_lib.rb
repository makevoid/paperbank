module MiniprintLib

  # rqrcode
  def qrcode_img(string)
    # for private keys you need bigger size
    size = string.size < 40 ? 4 : 7
    qr = RQRCode::QRCode.new(string, size: size, level: :h )
    png = qr.to_img                                             # returns an instance of ChunkyPNG
    png.resize 370, 370
  end

  # escper
  def print_img_send(path)
    File.open(PRINTER,'w') do |f|
      f.write Escper::Img.new(path, :file).to_s
    end
  end

  # utils

  def debug(file)
    `nautilus #{file}`
  end

  def test_connection
    `cat templates/asd.txt > #{PRINTER}`
  end

  def line
    print_send "\n"
  end

  def space
    print_send "\n\n\n"
  end

  def print_send(string)
    `echo '#{string}' > #{PRINTER}`
  end

end
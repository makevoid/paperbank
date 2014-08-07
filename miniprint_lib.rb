module MiniprintLib

  # rqrcode
  def qrcode_img(string)
    qr = RQRCode::QRCode.new(string, size: 4, level: :h )
    png = qr.to_img                                             # returns an instance of ChunkyPNG
    png.resize 350, 350
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

  def space
    print_send "\n\n"
  end

  def print_send(string)
    `echo '#{string}' > #{PRINTER}`
  end

end
class Table
  def valid_position?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end
end

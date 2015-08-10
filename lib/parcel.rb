class Parcel
  define_method(:initialize) do |width, height, depth|
    @width = width
    @height = height
    @depth = depth
  end

  define_method(:volume) do
    @width.*(@height).*(@depth)
  end
end

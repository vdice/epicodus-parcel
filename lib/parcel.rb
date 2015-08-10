class Parcel
  STANDARD_DISTANCE = 500
  STANDARD_VOLUME = 72
  STANDARD_WEIGHT = 1
  STANDARD_COST = 5
  GIFT_WRAP_RATE = 0.05

  define_method(:initialize) do |width, height, depth, weight, service, distance, gift_wrap|
    @width = width.to_f
    @height = height.to_f
    @depth = depth.to_f
    @weight = weight.to_f
    @service = service
    @distance = distance.to_f
    @gift_wrap = gift_wrap
  end

  define_method(:volume) do
    @width.*(@height).*(@depth)
  end

  define_method(:surface_area) do
    2.*(@width.*(@depth)).+(2.*(@height.*(@depth))).+(2.*(@height.*(@width)))
  end

  define_method(:cost_to_ship) do
    cost = STANDARD_COST

    cost += 10 if volume().>(STANDARD_VOLUME)
    cost += @weight.*(0.5) if @weight.>(STANDARD_WEIGHT)
    cost += 5 if @service.downcase().==('expedited')
    cost += 15 if @service.downcase().==('overnight')
    cost += ((@distance.-(STANDARD_DISTANCE)).*(0.01)) if @distance.>(STANDARD_DISTANCE)
    cost += surface_area().*(GIFT_WRAP_RATE) if @gift_wrap

    cost
  end
end

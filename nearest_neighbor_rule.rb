#
#= 座標上の１点を表すクラス
#
class Point

	# 2次元上の座標
	attr_accessor :x, :y

	# 座標を初期化
	def initialize(x, y)
		@x, @y = x, y
	end

	# 座標を表示
	def print
		puts "(#{@x}, #{@y})"
	end

	# 他の点を引数に受け取り，その点との距離を計算する
	def dist(p)
		Math.sqrt( (@x - p.x) ** 2 + (@y - p.y) ** 2)
	end
end

#
#= NN法を扱うクラス
#
class NNRule

	# 初期化
	def initialize
		@points = Hash.new
	end

	# 点を追加
	def add_point(p, class_name)
		unless @points.has_key? class_name
			@points[class_name] = []
		end
		@points[class_name].push p
	end

	# 点をすべて表示
	def print_all_points(class_name)
		if @points.has_key? class_name
			@points[class_name].each do |p|
				p.print
			end
		end
	end

	# 点pと一番近い点を出力
	def nearest_neighbor(p)
		min = Float::INFINITY
		min_p = nil 
		min_c = nil
		@points.each do |c, class_points|
			class_points.each do |p2|
				d = p.dist p2
				if d < min
					min = d
					min_p = p2
					min_c = c
				end
			end
		end
		puts "class: #{min_c}"
		min_p.print
	end

end

nn = NNRule.new

p1 = Point.new(1, 2)
nn.add_point(p1, "a")
p2 = Point.new(2, 3)
nn.add_point(p2, "b")
nn.print_all_points("a")
puts p1.dist p2
nn.nearest_neighbor(Point.new(1.5,2.6))

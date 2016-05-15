class DiscreteFourierTransform
  class << self
    def transform(x)
      _N = x.length
      Array.new(_N, 0.0).tap do |_X|
        (0..._N).each do |k|
          (0..._N).each do |n|
            _X[k] += x[n] * Math::E ** (-2i * Math::PI * k * n / _N)
          end
        end
      end
    end

    def inverse_transform(_X)
      _N = _X.length
      Array.new(_N, 0.0).tap do |x|
        (0..._N).each do |k|
          (0..._N).each do |n|
            x[k] += (_X[n] * Math::E ** (2i * Math::PI * k * n / _N)) / _N
          end
        end
      end
    end
  end
end

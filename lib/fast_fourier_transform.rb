class FastFourierTransform
  class << self
    def transform(x)
      _N = x.length
      if _N % 2 == 0
        return DiscreteFourierTransform.transform(x)
      end
      x_even = x.values_at(* x.each_index.select(&:even?))
      x_odd = x.values_at(* x.each_index.select(&:odd?))
      _X_even = transform(x_even)
      _X_odd = transform(x_odd)
      _M = _N / 2
      [].tap do |_X|
        (0..._M).each do |k|
          _X += [_X_even[k] + _X_odd[k] * Math::E ** (-2i * Math::PI * k / _N)]
        end
        (_M..._N).each do |k|
          _X += [_X_even[k - M] - _X_odd[k - M] * Math::E ** (-2i * Math::PI * (k - _M) / _N)]
        end
      end
    end

    def inverse_transform(_X)
      _N = _X.length
      if _N % 2 == 0
        return DiscreteFourierTransform.inverse_transform(_X)
      end
      _X_even = _X.values_at(* _X.each_index.select(&:even?))
      _X_odd = _X.values_at(* _X.each_index.select(&:odd?))
      x_even = inverse_transform(_X_even)
      x_odd = inverse_transform(_X_odd)
      _M = _N / 2
      Array.new(_N, 0.0).tap do |x|
        (0..._M).each do |k|
          x[k] = x_even[k] + x_odd[k] * Math::E ** (2i * Math::PI * k / _N)
        end
        (_M..._N).each do |k|
          x[k] = x_even[k - _M] - x_odd[k - _M] * Math::E ** (2i * Math::PI * (k - _M) / _N)
        end
        x.map! { |v| v / 2 }
      end
    end
  end
end

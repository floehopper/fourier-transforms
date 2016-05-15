```ruby
require 'discrete_fourier_transform'

DiscreteFourierTransform.transform([0, 1, 0, 1, 0, 1]).map(&:real).map(&:round) # => [3, 0, 0, -3, 0, 0]
DiscreteFourierTransform.inverse_transform([3, 0, 0, -3, 0, 0]).map(&:real).map(&:round) # => [0, 1, 0, 1, 0, 1]
```

```ruby
require 'fast_fourier_transform'

FastFourierTransform.transform([0, 1, 0, 1, 0, 1]).map(&:real).map(&:round) # => [3, 0, 0, -3, 0, 0]
FastFourierTransform.inverse_transform([3, 0, 0, -3, 0, 0]).map(&:real).map(&:round) # => [0, 1, 0, 1, 0, 1]
```

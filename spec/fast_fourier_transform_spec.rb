require 'fast_fourier_transform'

RSpec.describe FastFourierTransform do
  it 'foo' do
    original_signal = [0, 1, 0, 1, 0, 1]
    transformed_signal = FastFourierTransform.transform(original_signal)
    signal = FastFourierTransform.inverse_transform(transformed_signal)
    real_and_rounded_signal = signal.map(&:real).map(&:round)
    expect(real_and_rounded_signal).to eq(original_signal)
  end
end

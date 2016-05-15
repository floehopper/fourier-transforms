require 'fast_fourier_transform'

RSpec.describe FastFourierTransform do
  it 'roundtrips input with even number of values' do
    original_signal = [0, 1, 0, 1, 0, 1]
    transformed_signal = FastFourierTransform.transform(original_signal)
    signal = FastFourierTransform.inverse_transform(transformed_signal)
    real_and_rounded_signal = signal.map(&:real).map(&:round)
    expect(real_and_rounded_signal).to eq(original_signal)
  end

  it 'roundtrips input with odd number of values' do
    original_signal = [0, 1, 0, 1, 0, 1, 0]
    transformed_signal = FastFourierTransform.transform(original_signal)
    signal = FastFourierTransform.inverse_transform(transformed_signal)
    real_and_rounded_signal = signal.map(&:real).map(&:round)
    expect(real_and_rounded_signal).to eq(original_signal)
  end
end

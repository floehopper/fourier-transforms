require 'fast_fourier_transform'

RSpec.describe FastFourierTransform do
  it 'gives same transform as DFT' do
    original_signal = [0, 1, 0, 1, 0, 1]
    dft_transformed_signal = DiscreteFourierTransform.transform(original_signal)
    fft_transformed_signal = FastFourierTransform.transform(original_signal)
    expect(fft_transformed_signal.map(&:real).map(&:round)).to eq (dft_transformed_signal.map(&:real).map(&:round))
  end

  it 'gives same inverse transform as DFT' do
    transformed_signal = [3, 0, 0, -3, 0, 0]
    dft_signal = DiscreteFourierTransform.inverse_transform(transformed_signal)
    fft_signal = FastFourierTransform.inverse_transform(transformed_signal)
    expect(dft_signal.map(&:real).map(&:round)).to eq (dft_signal.map(&:real).map(&:round))
  end

  it 'roundtrips signal with even number of values' do
    original_signal = [0, 1, 0, 1, 0, 1]
    transformed_signal = FastFourierTransform.transform(original_signal)
    signal = FastFourierTransform.inverse_transform(transformed_signal)
    real_and_rounded_signal = signal.map(&:real).map(&:round)
    expect(real_and_rounded_signal).to eq(original_signal)
  end

  it 'roundtrips signal with odd number of values' do
    original_signal = [0, 1, 0, 1, 0, 1, 0]
    transformed_signal = FastFourierTransform.transform(original_signal)
    signal = FastFourierTransform.inverse_transform(transformed_signal)
    real_and_rounded_signal = signal.map(&:real).map(&:round)
    expect(real_and_rounded_signal).to eq(original_signal)
  end
end

require 'fast_fourier_transform'

RSpec.describe FastFourierTransform do
  it 'gives same transform as DFT' do
    signal = [0, 1, 0, 1, 0, 1]
    dft_spectrum = DiscreteFourierTransform.transform(signal)
    fft_spectrum = FastFourierTransform.transform(signal)
    expect(real_and_rounded(fft_spectrum)).to eq (real_and_rounded(dft_spectrum))
  end

  it 'gives same inverse transform as DFT' do
    spectrum = [3, 0, 0, -3, 0, 0]
    dft_signal = DiscreteFourierTransform.inverse_transform(spectrum)
    fft_signal = FastFourierTransform.inverse_transform(spectrum)
    expect(real_and_rounded(fft_signal)).to eq (real_and_rounded(dft_signal))
  end

  it 'roundtrips signal with even number of values' do
    signal = [0, 1, 0, 1, 0, 1]
    spectrum = FastFourierTransform.transform(signal)
    roundtripped_signal = FastFourierTransform.inverse_transform(spectrum)
    expect(real_and_rounded(roundtripped_signal)).to eq(signal)
  end

  it 'roundtrips signal with odd number of values' do
    signal = [0, 1, 0, 1, 0, 1, 0]
    spectrum = FastFourierTransform.transform(signal)
    roundtripped_signal = FastFourierTransform.inverse_transform(spectrum)
    expect(real_and_rounded(roundtripped_signal)).to eq(signal)
  end
end

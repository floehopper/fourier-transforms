require 'discrete_fourier_transform'

RSpec.describe DiscreteFourierTransform do
  it 'transforms signal' do
    signal = [0, 1, 0, 1, 0, 1]
    spectrum = DiscreteFourierTransform.transform(signal)
    expect([3, 0, 0, -3, 0, 0]).to eq(real_and_rounded(spectrum))
  end

  it 'inverse transforms spectrum' do
    spectrum = [3, 0, 0, -3, 0, 0]
    signal = DiscreteFourierTransform.inverse_transform(spectrum)
    expect([0, 1, 0, 1, 0, 1]).to eq(real_and_rounded(signal))
  end

  it 'roundtrips signal' do
    signal = [0, 1, 0, 1, 0, 1]
    spectrum = DiscreteFourierTransform.transform(signal)
    roundtripped_signal = DiscreteFourierTransform.inverse_transform(spectrum)
    expect(real_and_rounded(roundtripped_signal)).to eq(signal)
  end
end

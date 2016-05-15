require 'discrete_fourier_transform'

RSpec.describe DiscreteFourierTransform do
  it 'roundtrips signal with even number of values' do
    original_signal = [0, 1, 0, 1, 0, 1]
    transformed_signal = DiscreteFourierTransform.transform(original_signal)
    signal = DiscreteFourierTransform.inverse_transform(transformed_signal)
    expect(real_and_rounded(signal)).to eq(original_signal)
  end

  it 'roundtrips signal with even number of values' do
    original_signal = [0, 1, 0, 1, 0, 1]
    transformed_signal = DiscreteFourierTransform.transform(original_signal)
    signal = DiscreteFourierTransform.inverse_transform(transformed_signal)
    expect(real_and_rounded(signal)).to eq(original_signal)
  end

  it 'roundtrips signal with odd number of values' do
    original_signal = [0, 1, 0, 1, 0, 1, 0]
    transformed_signal = DiscreteFourierTransform.transform(original_signal)
    signal = DiscreteFourierTransform.inverse_transform(transformed_signal)
    expect(real_and_rounded(signal)).to eq(original_signal)
  end
end

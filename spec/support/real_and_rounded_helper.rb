module RealAndRoundedHelper
  def real_and_rounded(signal)
    signal.map(&:real).map(&:round)
  end
end

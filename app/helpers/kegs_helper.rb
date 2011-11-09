module KegsHelper
  def fullness_class(keg)
    case keg.days_til_empty
    when 0
      'almost-empty'
    when 1..3
      'close-to-empty'
    end
  end
end

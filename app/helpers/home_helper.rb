module HomeHelper

  def issue_ratings(count)
    return 0 if count.empty?
    return 5 if count['CRITICAL'] > 1
    return 4 if count['CRITICAL'] == 1
    return 3 if count['MAJOR'] > 1
    return 2 if count['MAJOR'] == 1
    return 1 if count['MINOR'] > 1
    return 1 if count['COSMETIC'] == 1 && count['MINOR'] == 1
    return 0
  end
end
